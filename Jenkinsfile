pipeline {
    agent any
    tools {
        Maven3
    }
    stages {
        stage('Clean WS') {
            steps {
                cleanWs()
            }
        }

        stage('Copy SCM') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/vladoz77/spring-petclinic'
            }
        }
    }
}
