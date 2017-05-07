#!groovy

node {
   def ENV = "Debug"
   def GIT_URL
   println "Env: ${ENV}"
   println "Service Name: ${srvName}\n Repo Name: ${repoName}"
   stage('Pull SCMs') {
      // Get some code from a GitHub repository
      //git 'https://github.com/jglick/simple-maven-project-with-tests.git'
      GIT_URL = "https://github.com/hyteer/${repoName}.git"
      echo "Git: ${GIT_URL}"
      //git url: "${GIT_URL}"
      sh 'rm -rf *'
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: srvName]], submoduleCfg: [], userRemoteConfigs: [[url: GIT_URL]]])
      //mvnHome = tool 'M3'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh 'echo "ready to build..."'
      } else {
         echo "not support none Unix system."
      }
   }
   stage('Results') {
      echo "results..."
   }
}
