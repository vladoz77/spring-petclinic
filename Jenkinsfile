pipeline {
    agent any
    tools{
        jdk "Java17"
        maven "Maven3"
    }

    environment{
        // APP_NAME="petclinic"
        // DOCKER_REPO="vladoz77"
        RELEASE="1.0.0"
        IMAGE_NAME="vladoz77/petclinic"
        IMAGE_TAG="${RELEASE}-${BUILD_NUMBER}"
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
                sh "mvn  package -Dcheckstyle.skip"
            }
        }

        stage('build image') {
            steps {
                script{
                    def customImage=docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    withDockerRegistry(credentialsId: 'dockerhub-token') {
                        customImage.push("${IMAGE_TAG}")
                        customImage.push('latest')
                    }
                }
            }
        } 

        
    }
    post {
        always  {
            junit '**/target/surefire-reports/TEST-*.xml'
            archiveArtifacts 'target/*.jar'
        }
         changed {
            emailext subject: "Job $JOB_NAME, build $BUILD_NUMBER, result build is $currentBuild.result", 
                body: "Please, go to $BUILD_URL and fix the build  $BUILD_NUMBER", 
                compressLog: true, 
                recipientProviders: [requestor(), upstreamDevelopers()], 
                attachLog: true,
                to: 'test@jenkins'       
        }
        

    }
}

void GitCheckout() {
        git branch: "${RepoBranch}", credentialsId: "${GitCred}", url: "${GitURL}"
}
