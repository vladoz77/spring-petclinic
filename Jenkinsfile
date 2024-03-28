pipeline {
    agent any
    tools{
        jdk "Java17"
        maven "Maven3"
    }
    parameters {
        booleanParam (defaultValue: false, description: 'run build?', name: 'BUILD')
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
            when {
                expression{ return params.BUILD}
            }
            steps {
                echo "${params.BUILD}"
                sh "mvn  package"
            }
        }
    }
    post{
        success {
            junit '**/target/surefire-reports/TEST-*.xml'
            archiveArtifacts 'target/*.jar'
        }
    }
}
