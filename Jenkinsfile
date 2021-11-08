pipeline {
    agent any
    
    	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
 stages {
     stage('Docker Build and Tag') {
               steps {

                    sh 'docker build -t shram/dockerhub_shramik:latest .'
                    sh 'docker tag shram/dockerhub_shramik:latest shram/dockerhub_shramik:$BUILD_NUMBER'
              }
            }
  
	stage('Login') {

		steps {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
	}

	stage('Push') {

		steps {
			sh 'docker push dockerhub_shramik:$BUILD_NUMBER'
			}
	}
      stage('Run Docker container on remote hosts') {

                steps {
             sh 'docker -H ssh://ubuntu@13.233.90.96 run -d -p 81:80 --name=helloworld shram/dockerhub_shramik'
         }
         }
    
  }
}
