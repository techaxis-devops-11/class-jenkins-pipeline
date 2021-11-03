pipeline {
    agent any
 stages {
     stage('Docker Build and Tag') {
               steps {

                    sh 'docker build -t shram/dockerhub_shramik:latest .'
                    sh 'docker tag shram/dockerhub_shramik:latest shram/dockerhub_shramik:$BUILD_NUMBER'
              }
            }
     
     stage('Publish image to Docker Hub') {

                steps {
            withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
              sh  'docker push shram/dockerhub_shramik:latest'
              sh  'docker push shram/dockerhub_shramik:$BUILD_NUMBER'
            }
         }
     }
     stage('Run Docker container on remote hosts') {

                steps {
             sh 'docker -H ssh://ubuntu@13.233.90.96 run -d -p 81:80 --name=helloworld shram/dockerhub_shramik'
         }
         }
    
  }
}
