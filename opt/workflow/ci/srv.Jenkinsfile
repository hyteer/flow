#!groovy
@Library('cilib')_
//@Library('mylib')_
//library 'mylib'
import sctek.opt.Utils
def ut = new Utils(steps)
def baseDir = base_dir
def registryServer = "10.100.100.130:5000"
def srvName = service_name
def branchName = branch
def node = "manager-132"
def runMode = run_mode
def gitOpsUrl = "http://10.100.100.54/sctek/workflow.git"
def srvCodeDir = "services/${srvName}/_code_/${srvName}"
def resIP = "10.100.100.31"
def resDomain = "downloads.vikduo.com"
def version_no = version



//def workSpace = env.WORKSPACE

//def gitOpsUrl = "https://github.com/hyteer/flow.git"
//def gitSrvUrl = "https://git.snsshop.net/OptPrime/${srvName}.git"
//def SRC_DIR = "opt-deploy/services/third-party/_code_/${srvName}"
//def CREDENTIALS_ID = "bee70a17-6e2f-472b-ba14-285b77af3e38"

buildSrv {
		BASE_DIR = baseDir
		SRV_NAME = srvName
		BRANCH = branchName
		RUN_MODE = runMode
		NODE = node
		REG_SERVER = registryServer
		VERSION = version_no
		//REPOS = "sample"
		//GIT_OPS_URL = "https://github.com/hyteer/flow.git"
		//SRC_DIR = "opt-deploy/services/third-party/_code_/${srvName}"
		GIT_OPS_URL = gitOpsUrl
		GIT_SRV_URL = "https://git.snsshop.net/OptPrime/${srvName}.git"
		SRV_CODE_DIR = srvCodeDir
		CREDENTIALS_ID = "bee70a17-6e2f-472b-ba14-285b77af3e38"
		UT = ut
}



/*
srvRun {

}
*/
