#!groovy

pipeline {
    agent any

    environment {
        ENV = "Debug"
        DB_ENGINE    = 'sqlite'
    }

    stages {
        stage("init workspace...") {
            steps {
                sh 'echo "Env: ${ENV}"'
                sh 'printenv'
            }
        }
        stage('Pull SCMs') {
            steps {
                println "Service: ${srvName}"
                println "Git address: ${gitUrl}"
                sh 'rm -rf *'
                //echo 'job for service: ${srvName}'
                //echo 'job run mode: ${runMode}'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: srvName]], submoduleCfg: [], userRemoteConfigs: [[url: gitUrl]]])
                //git gitUrl
            }
        }
    }
}
