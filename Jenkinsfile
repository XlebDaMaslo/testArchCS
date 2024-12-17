pipeline {
   agent any
    
  environment {
    image_name = 'test-app'
   context_folder = '.'
  }
 stages {
  stage('Build image'){
    steps {
    sh "docker build -t ${image_name}:latest --file ${context_folder}/Dockerfile ${context_folder}"
    }
    }
      stage("Run Container") {
           steps {
                script {
                      def containers = sh(script: 'docker ps -a -q --filter ancestor=${image_name}:latest', returnStdout: true).trim()
                       if (!containers) { // если не существует то просто запускаем 
                          sh "docker run --rm -d --network=app_net --name=app -p 8080:80 --label \"traefik.enable=true\" --label \"traefik.http.routers.app.rule=Host(\`app.ваш-домен.com\`)\" --label \"traefik.http.routers.app.entrypoints=websecure\" --label \"traefik.http.routers.app.tls=true\" --label \"traefik.http.routers.app.tls.certresolver=myresolver\"  ${image_name}:latest " 
                       } else { //иначе  удалить  контейнер старый
                         sh "docker stop app" 
                             sh "docker rm app" //после удалить и пересоздать с тем же именем
                         sh "docker run --rm -d --network=app_net --name=app -p 8080:80 --label \"traefik.enable=true\" --label \"traefik.http.routers.app.rule=Host(\`app.ваш-домен.com\`)\" --label \"traefik.http.routers.app.entrypoints=websecure\" --label \"traefik.http.routers.app.tls=true\" --label \"traefik.http.routers.app.tls.certresolver=myresolver\"  ${image_name}:latest"
                        
                         }

                    } 
          }
       }
    }
}
