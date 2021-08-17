def dockerhub_shramik
pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t dockerhub_shramik:latest .'
                sh 'docker tag dockerhub_shramik:latest dockerhub_shramik:$BUILD_NUMBER'
          }
        }
     
 stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          sh  'docker push dockerhub_shramik:$BUILD_NUMBER'
        }
                  
        }
    }
}
}
