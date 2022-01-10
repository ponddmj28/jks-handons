pipeline {

    agent any
    environment {
        PASSWORD_DOCKER=credentials("dockerhub-tosaporn")
    }
    tools {
            maven "jenkins-maven"
        }
    stages {

        stage('Initialize'){
                    steps{
                        echo "PATH = ${M2_HOME}/bin:${PATH}"
                        sh ''' export IMAGE=hello-world-jenkins
                                export TAG=0.0.1
                        '''
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
        }

        stage('Test') {
            steps {
                sh '''
                    mvn test -e -f ./java-app
                   '''
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
                                    sh 'bash -i /var/jenkins_home/key-pairs/remote-key remote_user@remote_host_prod /tmp/publish.sh'
                        }
            }
        }
    }
}
