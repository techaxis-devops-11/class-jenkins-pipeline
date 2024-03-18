pipeline { 

    environment { 

        registry = "techaxis/python" 

        registryCredential = 'dockerhub' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/shramikawale/helloworld.git' 

            }

        } 
        stage('sonarqube scan'){
            steps{
                withSonarQubeEnv("SonarQube")
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
