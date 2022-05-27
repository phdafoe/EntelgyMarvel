pipeline {
  parameters {
    // the default choice for commit-triggered builds is the first item in the choices list
    choice(name: 'buildVariant', choices: ['Debug_Scan_Only', 'Debug_TestFlight', 'Release_AppStore_TestFlight'], description: 'The variants to build')
    }
  environment {
    LC_ALL = 'en_US.UTF-8'
    APP_NAME = 'Marvel'
    BUILD_NAME = 'Marvel'
    APP_TARGET = 'Marvel'
    APP_PROJECT = 'Marvel.xcodeproj'
    APP_TEST_SCHEME = 'MarvelTests'
  }
  stages {
    //<< Git SCM Checkout >>
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Update Env with Build Variant') {
      steps {
        script {
          env.BUILD_VARIANT = params.buildVariant
          // Conditionally define a build variant 'impact'
          if (BUILD_VARIANT == 'Debug_TestFlight') {
            echo "Debug_TestFlight"
          } else if (BUILD_VARIANT == 'Release_AppStore_TestFlight') {
            echo "Release_AppStore_TestFlight"
          }
        }
      }
    }

    stage('Git - Fetch Version/Commits') {
      steps {
        script {
          //Shell commands
          env.GIT_COMMIT_MSG = sh(returnStdout: true, script: ''' git log -1 --pretty=%B ${GIT_COMMIT} ''').trim()
          def DATE_TIME = sh(returnStdout: true, script: ''' date +%Y.%m.%d-%H:%M:%S ''').trim()
        }
      }
    }

    stage('error') {
      steps {
        git(url: 'https://github.com/phdafoe/EntelgyMarvel.git', branch: 'main', changelog: true, poll: true)
      }
    }
  }
}
