#!groovy
pipeline {
    agent any

    environment {
        DISABLE_AUTH = 'true'
        MESSAGE = 'Just a test!'
    }

    stages {
        stage('Build') {
            steps {
                echo "starts..."
                acme.name = 'Alice'
                echo acme.name /* prints: 'Alice' */
                acme.caution 'The queen is angry!'
            }
        }
    }
}
