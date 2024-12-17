pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("local/python-app:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                        docker stop python-app-container || true
                        docker rm python-app-container || true
                    '''
                    sh """
                        docker run -d --name python-app-container -p 8000:5000 local/python-app:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}