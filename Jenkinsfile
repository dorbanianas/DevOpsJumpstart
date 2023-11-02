pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building..."'
                sh 'mvn clean package'
            }
        }

        // Add more stages for testing, deployment, etc.
    }
}
