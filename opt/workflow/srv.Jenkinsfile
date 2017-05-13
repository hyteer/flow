#!groovy
@Library('cilib')_
//@Library('mylib')_
//library 'mylib'

def srvName = service_name
def branchName = branch
def runMode = run_mode
//def gitOpsUrl = "https://github.com/hyteer/flow.git"
//def gitSrvUrl = "https://git.snsshop.net/OptPrime/${srvName}.git"
//def SRC_DIR = "opt-deploy/services/third-party/_code_/${srvName}"
//def CREDENTIALS_ID = "bee70a17-6e2f-472b-ba14-285b77af3e38"

srvBuild {
		SRV_NAME = srvName
		BRANCH = branchName
		RUN_MODE = runMode
		REPOS = "sample"
		NODE = "node-5"
		//GIT_OPS_URL = "https://github.com/hyteer/flow.git"
		//SRC_DIR = "opt-deploy/services/third-party/_code_/${srvName}"
		GIT_OPS_URL = "http://10.100.100.54/sctek/workflow.git"
		GIT_SRV_URL = "https://git.snsshop.net/OptPrime/${srvName}.git"
		SRC_DIR = "services/third-party/_code_/${srvName}"

		CREDENTIALS_ID = "bee70a17-6e2f-472b-ba14-285b77af3e38"
}

srvRun {

}
