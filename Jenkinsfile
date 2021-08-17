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
          sh  'docker push shram/dockerhub_shramik:$BUILD_NUMBER'
        }
                  
        }
    }
  }
}