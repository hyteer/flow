#!groovy
@Library('cilib')_
//@Library('mylib')_
//library 'mylib'
import sctek.opt.Utils
def ut = new Utils(steps)
def node = "manager-132"
def registryServer = "10.100.100.130:5000"
def version = "ci"
//def branch = "*/master"
def gitOpsUrl = "http://10.100.100.54/sctek/workflow.git"
String resIP = "10.100.100.31"
String resDomain = "downloads.vikduo.com"
String gateGoName = "gate-go"
def credentialsId = "bee70a17-6e2f-472b-ba14-285b77af3e38"
def servicesMap = [
    [name:'service-base', flag:'true'],
    [name:'service-qrcode', flag:'true'],
    [name:'service-third-party', flag:'true'],
    [name:'service-third-party-interface', flag:'true'],
    [name:'service-pay', flag:'true'],
    [name:'service-shop', flag:'true'],
    [name:'service-user', flag:'true'],
    [name:'service-order', flag:'true'],
    [name:'service-product', flag:'true'],
    [name:'service-message', flag:'true'],
    //[name:'service-third-party', flag:'true'],
    //[name:'service-pay', flag:'true'],
    //[name:'service-third-party-', dir: 'gate-go', flag:'false'],
   ]

/*
preBuild {
		NODE = node
		GIT_OPS_URL = gitOpsUrl
    UT = ut
}
*/

sayHello 'Joe'

// 初始化
initEnv {
    NODE = node
    GIT_OPS_URL = gitOpsUrl
    UT = ut
}

// Consul
buildConsul {
    NODE = node
    VERSION = version
    SRV_NAME = "consul"
    UT = ut
}

// Nginx
buildNginx {
    NODE = node
    VERSION = version
    SRV_NAME = "nginx"
    REPOS_NAME = "frontend-h5-rest-shop"
    BRANCH = "*/master"
    CREDENTIALS_ID = credentialsId
    GIT_URL = "https://git.snsshop.net/OptPrime/frontend-h5-rest-shop.git"
    UT = ut
}

// Go
/*
buildGo {
		//BASE_DIR = baseDir
		SRV_NAME = gateGoName
		VERSION = version
		//WORKDIR = "${WORKSPACE}/${srvName}"
		CODE_DIR = "${gateGoName}/_code_"
		RUN_MODE = runMode
		GO_PACKAGE="go_gateway.tar.xz"
		RES_IP = resIP
		RES_DOMAIN = resDomain
		NODE = node
		UT = ut
}
*/

// 服务
buildSrvMaster {
    NODE = node
    VERSION = version
    GIT_OPS_URL = gitOpsUrl
    UT = ut
    SRV_MAP = servicesMap
}


/*
node ("node-5") {
    stage("镜像构建") {
        echo '===Scripts Pipeline...'
        def services = ['pay', 'qrcode']
        for (int i = 0; i < servicesMap.size(); ++i) {
          echo "Pull SCM service ${servicesMap[i]}..."
          build job: 'srv-debug', parameters: [string(name: 'service_name', value: servicesMap[i]['name']), string(name: 'run_mode', value: '1')]
        }

    }
    stage("测试环境部署") {
        echo "===Build docker images..."
    }
    stage("自动化测试") {
        echo "===Build docker images..."
    }

}
*/
