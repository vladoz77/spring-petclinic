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
            environment {
                RepoBranch = 'main'
                GitCred = 'github-cred'
                GitURL = 'https://github.com/vladoz77/spring-petclinic'
            }
            steps {
                GitCheckout()
                // git branch: 'main', credentialsId: 'github', url: 'https://github.com/vladoz77/spring-petclinic'
            }
        }

        stage('maven build') {
           
            steps {
                // sh "mvn  package -Dcheckstyle.skip"
                sh "true"
            }
        } 

        
    }
    post {
<<<<<<< HEAD
        always  {
            junit '**/target/surefire-reports/TEST-*.xml'
            archiveArtifacts 'target/*.jar'
        }
        //  changed {
        //     emailext subject: "Job $JOB_NAME, build $BUILD_NUMBER, result build is $currentBuild.result", 
        //         body: "Please, go to $BUILD_URL and fix the build  $BUILD_NUMBER", 
        //         compressLog: true, 
        //         recipientProviders: [requestor(), upstreamDevelopers()], 
        //         attachLog: true,
        //         to: 'test@jenkins'       
        // }
=======
        // always  {
            // junit '**/target/surefire-reports/TEST-*.xml'
            // archiveArtifacts 'target/*.jar'
        // }
         changed {
            emailext subject: "Job $JOB_NAME, build $BUILD_NUMBER, result build is $currentBuild.result", 
                body: "Please, go to $BUILD_URL and fix the build  $BUILD_NUMBER", 
                compressLog: true, 
                recipientProviders: [requestor(), upstreamDevelopers()], 
                attachLog: true,
                to: 'test@jenkins'       
        }
>>>>>>> parent of 161a7e1 (config Jenkinsfile for test mail notif)
        

    }
}

void GitCheckout() {
        git branch: "${RepoBranch}", credentialsId: "${GitCred}", url: "${GitURL}"
}
