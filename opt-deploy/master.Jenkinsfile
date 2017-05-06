#!groovy
def env="Debug"

pipeline {
    agent { label 'node-5'}
    stages {
        stage('镜像构造') {
            steps {
                //sh 'echo "Pull git repos..."'
                sh 'echo "开始构造镜像..."'
                build 'OPT/services/third-party-interface2'
                //checkout([$class: 'GitSCM', branches: [[name: '*/debug']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '83edf549-cf8a-4056-9ed2-d8b635a4a5ee', url: 'http://10.100.100.54/snsshop/opt-deploy.git']]])
                //sh 'echo "checkout frontend-h5-rest-shop..."'
                //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'nginx/_code_/frontend-h5-rest']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bee70a17-6e2f-472b-ba14-285b77af3e38', url: 'https://git.snsshop.net/OptPrime/frontend-h5-rest-shop.git']]])
                //sh 'echo "checkout frontend-h5-rest-shop..."'
                sh 'echo "镜像构造完毕..."'


            }
        }
        stage('测试环境部署') {
            steps {
                //sh 'echo "Init thrift..."'
                sh '''
                    echo "开始部署测试环境..."
                    date
                '''
            }
        }
        stage('自动化测试') {
            steps {
                sh 'echo "开始自动化测试..."'
                sh 'sleep 3'
                sh 'echo "完成自动化测试..."'
            }
        }
        stage('人工测试复核') {
            steps {
                sh 'echo "测试结果复核..."'
                //input '确认测试结果'
                input message: '确认测试结果', ok: '确认通过', submitterParameter: 'huyt'
                sh 'echo "完成复核..."'
            }
        }
        stage('灰度发布') {
            steps {
                sh 'echo "开始线上灰度发布..."'
                sh 'sleep 3'
                sh 'echo "完成灰度发布..."'
            }
        }

    }
}
