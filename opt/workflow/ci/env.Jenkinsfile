@Library('cilib')_

node {
    withEnv(['DISABLE_AUTH=true',
             'DB_ENGINE=sqlite']) {
        stage('Build') {
            echo "starts..."
            acme.name = 'Alice'
            echo acme.name /* prints: 'Alice' */
            acme.caution 'The queen is angry!'
        }
    }
}
