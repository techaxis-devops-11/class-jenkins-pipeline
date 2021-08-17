pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t ibanez6123/python_app:latest .' 
                sh 'docker tag ibanez6123/python_app:latest ibanez6123/python_app:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) 
              {
                  sh  'docker push ibanez6123/python_app:$BUILD_NUMBER'
              }
                  
           }
      }
    }
}
