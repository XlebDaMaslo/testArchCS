pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                   dockerImage = docker.build("my-test-app-${BUILD_NUMBER} -f Dockerfile")
                   
                }
            }
        }
        stage('Deploy') {
            steps {
                 script {
                  docker.withRegistry('',''){
                    dockerImage.push()
                  }
                 }
                 
                  
                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'
                sh 'docker run -d --name my-app -p 8081:80 my-test-app:${BUILD_NUMBER}'
                
            }
        }
    }
}
