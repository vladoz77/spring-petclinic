pipeline {
    agent any
    tools{
        jdk "Java17"
        maven "Maven3"
    }
    triggers {
        pollSCM 'H/15 * * * *'
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
                sh "mvn  package -Dcheckstyle.skip"
            }
        }
    }
    post {
        success {
            junit '**/target/surefire-reports/TEST-*.xml'
            archiveArtifacts 'target/*.jar'
        }
         changed {
            emailext attachLog: true, body: 'Please, go to $(BUILD_URL) and fix the build  $(BUILD_NUMBER)', compressLog: true, recipientProviders: [requestor(), upstreamDevelopers()], subject: 'Job $(JOB_NAME) and   $(BUILD_NUMBER) is waiting for fix'        
        }
        

    }
}
