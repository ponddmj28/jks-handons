pipeline {

    agent any
    environment {
        PASSWORD_DOCKER=credentials("dockerhub-tosaporn")
        IMAGE="hello-world-jenkins"
        TAG="0.0.1"
    }
    tools {
            maven "jenkins-maven"
        }
    stages {

        stage('Initialize'){
                    steps{
                        echo "PATH = ${M2_HOME}/bin:${PATH}"
                    }
        }

        stage('Build') {
            steps {
                sh '''
                    chmod 777 -R jenkins
                    chmod 777 -R java-app
                    mvn -B clean install -e -f ./java-app
                    ./jenkins/build/build.sh
                '''
            }
            post {
                    success {
                        archiveArtifacts artifacts: 'java-app/target/*.jar',fingerprint: true
                    }
            }
        }

        stage('Test') {
            steps {
                sh '''
                    mvn test -e -f ./java-app
                   '''
            }
            post {
                    always {
                        junit 'java-app/target/surefire-reports/*.xml'
                    }
            }
        }

        stage('Push') {
            steps {
                sh '''
                                     ./jenkins/push/push.sh
                   '''
            }
        }

        stage('Pre-Deploy') {
            steps {
                sh '''
                     ./jenkins/deploy/deploy.sh
                   '''
            }
        }

        stage ('Deploy') {
            steps{
                sshagent(credentials : ['remote_user']) {
                           sh 'ssh remote_user@remote_host_prod /tmp/publish.sh'
                        }
            }
        }
    }
}
