def dockerhub_shramik
pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t dockerhub_shramik:latest .'               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
                    withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) 
                    bat "docker tag dockerhub_shramik:latest dockerhub_shramik:$BUILD_NUMBER"
                    bat "docker push dockerhub_shramik:$BUILD_NUMBER"
           }

      }
    }
}
