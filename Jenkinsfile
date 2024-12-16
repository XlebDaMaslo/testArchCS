pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def imageName = "my-app:${BUILD_NUMBER}"
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        stage('Deploy') {
            steps {
              script {
                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'
               
                def imageName = "my-app:${BUILD_NUMBER}"

                sh "docker run -d --name my-app -p 80:80 ${imageName}"
             }
           }
       }
    }
}