pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t dockerhub_username/repository_name/docker-jenkins-integration .'               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
                scripts{
                    withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) 
                    bat "docker tag dockerhub_username/repository_name/docker-jenkins-integration dockerhub_username/repository_name:docker-jenkins-integration"
                    bat "docker push dockerhub_username/repository_name:docker-jenkins-integration"
                }
           }

      }
    }
}
