pipeline { 

    environment { 

        registry = "shram/dockerhub_shramik" 

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
             sh 'docker -H ssh://ubuntu@18.222.174.242 run -d -p 80:80 --name=helloworld shram/dockerhub_shramik'
            }
           
        }
    
    }

}
