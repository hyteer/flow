node {
    println "Pipeline shared library test..."

    echo '#demo1: use static lib...'
    //@Library('mylib')_
    library 'mylib'
    demo.setName("YT")
    def name = demo.getName()
    println "Name: ${name}"

    echo '#demo2: opt env...'
    opt.setEnv('Debug')
    def env = opt.getEnv()
    println "Env: ${env}"

    echo '#demo3: class in vars...'
    acme.name = 'Alice'
    echo acme.name /* prints: 'Alice' */
    acme.caution 'The queen is angry!'

    /*echo '#2 on the fly...'
    library 'mylib'
    def res = OptMaster.downUrl
    println "Res: ${res}"*/
}
