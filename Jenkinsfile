pipeline {
  environment {
    registry = "lakshmidevy/docker-test"
    registryCredential = "dockerhub"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Lakshmidevy/parking_frontend'
      }
    }
	stage('Build'){

		steps{

             sh 'npm install' 
			 sh 'npm run build' 
			 sh 'cp -r $WORKSPACE/build /usr/local/tomcat/webapps
              } 
            } 

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
}
	}
}
