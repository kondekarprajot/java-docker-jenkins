pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKERHUB_REPO = 'kondekarprajot/java-docker-jenkins'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/kondekarprajot/java-docker-jenkins.git'
            }
        }

        stage('Build Jar') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKERHUB_REPO% ."
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker login -u %DOCKERHUB_CREDENTIALS_USR% -p %DOCKERHUB_CREDENTIALS_PSW%"
                bat "docker push %DOCKERHUB_REPO%"
            }
        }

        stage('Clean Up') {
            steps {
                bat "docker rmi %DOCKERHUB_REPO% || exit 0"
            }
        }
    }

    post {
        success {
            echo '✅ Build and push successful!'
        }
        failure {
            echo '❌ Build failed.'
        }
    }
}
