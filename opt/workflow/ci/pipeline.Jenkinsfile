node {
    stage("构建环境初始化") {
        echo "初始化构建环境..."
        sh 'sleep 3'
    }
}

node {
    stage("底层构建") {
        parallel(
            "Sonar": {
                echo "代码检测..."
                echo 'Sonar code scan...'
                sh 'sleep 3'
            },
            "单元测试": {
                echo 'Unit test...'
                sh 'sleep 2'
            },
            "编译": {
                echo 'Compiling...'
                sh 'sleep 2'
            }
        )

    }
}

node {
    stage("Docker镜像构建"){
        parallel(
            "Go网关": {
                echo '构建Go网关镜像...'
                sh 'sleep 2'
            },
            "PHP网关": {
                echo '构建Nginx镜像...'
                sh 'sleep 4'
            },
            "Nginx": {
                echo '构建Nginx镜像...'
                sh 'sleep 3'
            },
            "Consul": {
                echo '构建Nginx镜像...'
                sh 'sleep 1'
            },
            "服务": {
                echo '构建服务镜像...'
                sh 'sleep 7'
            }
        )
    }
}

node {
    stage("测试环境部署") {
        echo "测试环境集群服务部署、更新..."
        sh 'sleep 5'
    }
}
node {
    stage("自动化测试") {
      parallel(
          "接口测试": {
              echo 'API集成测试...'
              sh 'sleep 2'
          },
          "UI测试": {
              echo 'UI冒烟测试...'
              sh 'sleep 3'
          }
      )
    }
}

node {
    stage("人工复核") {
      echo "人工测试完成后确认..."
      sh 'sleep 3'
      input id: 'Test_confirm', message: '确认测试通过？', ok: '确认', submitterParameter: 'test_submitter'
    }
}
node {
    stage("灰度发布") {
      echo "灰度发布、部署、更新..."
      sh 'sleep 3'
    }
}

node {
    stage("正式上线") {
      echo "灰度上线一段时间稳定后确认正式上线..."
      sh 'sleep 2'
      input id: 'Pub_confirm', message: '确认正式上线？', ok: '确认', submitterParameter: 'pub_submitter'
    }
}
