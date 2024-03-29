pipeline { 

    environment { 

        registry = "techaxis/python" 

        registryCredential = 'dockerhub' 

        dockerImage = '' 

        SONAR_TOKEN = credentials('sonar_token')

    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/shramikawale/helloworld.git' 

            }

        } 
        stage('SonarQube Analysis') {
            steps {
                // Run SonarQube analysis
                script {
                    withSonarQubeEnv('SonarQube Server') {
                        sh "${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=pipeline-job_python \
                            -Dsonar.sources=. \
                            -Dsonar.python.coverage.reportPaths=coverage.xml \
                            -Dsonar.python.xunit.reportPath=xunit.xml \
                            -Dsonar.host.url=http://3.139.68.104:9000/ \
                            -Dsonar.login=${env.SONAR_TOKEN}"
                    }
                }
            }
        }
        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Push image to Dockerhub') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

       stage('Run Docker container on remote hosts') {

             steps {
             sh 'docker -H ssh://ubuntu@54.90.247.48 run -d -p 3001:80 --name=helloworld4 techaxis/python'
            }
           
        }
    
    }

}
