#!groovy
def env="Debug"

pipeline {
    agent { label 'node-5'}
    stages {
        stage('拉取代码') {
            steps {
                //sh 'echo "Pull git repos..."'
                sh '''echo "checkout deploy codes..."'''
                checkout([$class: 'GitSCM', branches: [[name: '*/debug']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '83edf549-cf8a-4056-9ed2-d8b635a4a5ee', url: 'http://10.100.100.54/snsshop/opt-deploy.git']]])
                sh 'echo "checkout frontend-h5-rest-shop..."'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'nginx/_code_/frontend-h5-rest']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bee70a17-6e2f-472b-ba14-285b77af3e38', url: 'https://git.snsshop.net/OptPrime/frontend-h5-rest-shop.git']]])
                sh 'echo "checkout frontend-h5-rest-shop..."'

                sh 'echo "checkout frontend-h5-rest-shop..."'

                
            }
        }
        stage('Stage2') {
            steps {
                //sh 'echo "Init thrift..."'
                sh '''
                    echo "create dir test2..."
                    date
                '''
            }
        }
        stage('Stage3') {
            steps {
                sh 'echo List dir...'
                sh 'ls ./ && ls /'
            }
        }

    }
}
