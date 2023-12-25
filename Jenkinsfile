pipeline {
    agent any
    tools{
        jdk "Java17"
        maven "Maven3"
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

        stage('maven build') {
            steps {
                sh "mvn  package"
            }
        }
    }
    post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
    }
}
