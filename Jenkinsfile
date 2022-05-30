def skipPublishDefault = (BRANCH_NAME == "hotfix") ? true : false

pipeline {
    agent {
        label 'ios'
    }
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
        timeout(time: 2, unit: 'HOURS')
    }
    parameters {
        booleanParam(defaultValue:skipPublishDefault, description:'Skip publishing - build only', name:'SKIP_PUBLISH')
    }
    stages {
        stage('Prepare & Validate') {
            steps {
                script {
                    echo 'Prepare & Validate'
                    iOSEngine.prepare()
                }
            }
        }
        stage('Quality & Unit tests') {
            steps {
                script {
                    echo 'Quality & Unit tests'
                    iOSEngine.runTests()
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    echo 'Build'
                    iOSEngine.build()
                }
            }
        }
        stage('Publish') {
            steps {
                script {
                    echo 'Publish'
                    iOSEngine.publish()
                }
            }
        }
    }

    post {
        success {
            script {
                echo 'develop|test|stage|production -> success'
            }
        }
        failure {
            script {
              echo 'develop|test|stage|production -> failure'
            }
        }
        aborted {
            script {
            echo 'develop|test|stage|production -> aborted'
            }
        }
        cleanup {
            script {
                echo 'cleaning workspace'
                cleanWs()
            }
        }
    }
}
