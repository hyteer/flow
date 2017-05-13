
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

        stage ('构建镜像Consul') {
          echo "=== Build: ${config.SRV_NAME} ==="
          //ut.sh "ls ${WORKDIR}"
          dir(WORKDIR) {
              // some block
              sh 'ls'
              //sh 'chmod +x scripts/*'
              ut.sh "docker build -t opt/${config.SRV_NAME}:${config.VERSION} ."
          }
        echo "=== Finished: ${config.SRV_NAME} ==="
      }
    }
}
