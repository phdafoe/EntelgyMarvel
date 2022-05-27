pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        git(url: 'https://github.com/phdafoe/EntelgyMarvel.git', branch: 'main', changelog: true, poll: true)
      }
    }

  }
}