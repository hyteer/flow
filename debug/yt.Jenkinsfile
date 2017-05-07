#!groovy

node {
   def ENV = "Debug"
   def GIT_URL
   println "Env: ${ENV}"
   println "Service Name: ${srvName}"
   stage('Preparation') {
      // Get some code from a GitHub repository
      //git 'https://github.com/jglick/simple-maven-project-with-tests.git'
      GIT_URL = "https://github.com/hyteer/${srvName}.git"
      echo "Git: ${GIT_URL}"
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
