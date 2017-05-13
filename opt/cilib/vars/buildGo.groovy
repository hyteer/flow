
def call(body) {
    // evaluate the body block, and collect configuration into the object
    def config = [:]
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = config
    body()
    //def buildNode = config.node
    println "Build Node: ${config.NODE}"
    ut = config.UT
    //def WORKDIR = "${pwd}/${config.SRV_NAME}"

    // now build, based on the configuration provided
    node (config.NODE) {
      	def WORKDIR = "${WORKSPACE}/${config.SRV_NAME}"
        def CODE_DIR = "${WORKDIR}/_code_"
      	echo "Work Directory: ${WORKDIR}"

        stage ('构建Go镜像') {
          echo "===拉取Go包: ${config.SRV_NAME}==="
          //dir("${WORKSPACE}/${config.SRV_DIR}") {
          //sh 'date && ls ${PWD}'
          ut.sh "ls ${WORKDIR}"
          ut.sh "rm -rf ${WORKDIR}/_code_"
          echo "ServiceName: ${config.SRV_NAME}"
          echo "ServiceDir: ${config.SRV_NAME}"
          ut.sh "echo ${config.RES_DOMAIN}"
          //ut.sh "echo ${config.RES_IP} ${config.RES_DOMAIN}>>/etc/hosts;"
          dir (WORKDIR){
              ut.sh "mkdir -p _code_ && cd _code_ && rm -rf *"
            }
      	  dir (CODE_DIR) {
              //ut.sh "wget http://${config.RES_DOMAIN}/go/${config.GO_PACKAGE}"
              ut.sh "ls && mkdir -p go && tar -xf ${config.GO_PACKAGE} -C go"
              ut.sh "ls ${WORKDIR}"
            }

          echo "===Build Image: ${config.SRV_NAME}==="
          dir(WORKDIR) {
              // some block
              sh 'ls ${PWD}'
              sh 'chmod +x scripts/*'
              ut.sh "docker build -t opt/${config.SRV_NAME}:${config.VERSION} ."
          }
      }
    }
}
