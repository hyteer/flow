#!groovy
@Library('mylib')_
//library 'mylib'
def SERVICE = "third-party"
def REPOS = "sample"
def BRANCH = "*/develop"
def BUILD_NODE = "node-5"
def GIT_OPS_URL = "https://github.com/hyteer/flow.git"
def GIT_SRV_URL = "https://git.snsshop.net/OptPrime/${SERVICE}.git"
def SRC_DIR = "opt-deploy/services/third-party/_code_/${SERVICE}"
def CREDENTIALS_ID = "bee70a17-6e2f-472b-ba14-285b77af3e38"

//def GIT_SRV_URL = "https://github.com/hyteer/${SERVICE}.git"

srvBuild {
          srvName = SERVICE
          repoName = REPOS
          branch = BRANCH
          node = BUILD_NODE
          gitOpsUrl = GIT_OPS_URL
          gitSrvUrl = GIT_SRV_URL
          srcDir = SRC_DIR
          credentialsId = CREDENTIALS_ID
          //srvName = "product"
          //repoName = "sample"
          //node = "node-5"
          //gitUrl = "https://github.com/hyteer/flow.git"
          //GIT_SRV_URL = "https://github.com/hyteer/sample.git"
          //GIT_OPS_URL = "http://10.100.100.54/snsshop/opt-deploy.git"

        }
