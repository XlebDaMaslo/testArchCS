pipeline {
    agent {
        docker { image 'docker' }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("my-test-app:latest")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('', '') {
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
