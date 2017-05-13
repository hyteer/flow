node {
    stage("拉取代码"){
        parallel(
            "webgate": {
                echo '单元测试...'
            },
            "services": {
                echo '集成测试...'
            }
        )
    }
}
node {
    stage("底层测试") {
        parallel(
            "Sonar": {
                echo 'Sonar code scan...'
                sh 'sleep 2'
            },
            "单元测试": {
                echo 'Unit test...'
                sh 'sleep 3'
            }
        )
    }
}
node {
    stage("测试环境部署") {
        echo "测试环境部署"
        sh 'sleep 3'
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
    }
}
node {
    stage("灰度发布") {
      echo "灰度发布、部署、更新..."
      sh 'sleep 3'
    }
}
