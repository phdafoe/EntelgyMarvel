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
                    # slack.info("*Build ${BUILD_NUMBER} started*\n<${JOB_URL}|${JOB_NAME}>", BRANCH_NAME ==~ /(test|stage|production)/)
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
                # slack.success("*Build ${BUILD_NUMBER} succeeded* :heavy_check_mark:\n<${JOB_URL}|${JOB_NAME}>", BRANCH_NAME ==~ /(test|stage|production)/)
                # slack.releaseNotification()
            }
        }
        failure {
            script {
                #slack.error("*Build ${BUILD_NUMBER} failed* :x:\n<${JOB_URL}|${JOB_NAME}> Console:<${BUILD_URL}console|${BUILD_NUMBER}>", BRANCH_NAME ==~ /(develop|test|stage|production)/)
            }
        }
        aborted {
            script {
                # slack.error("*Build ${BUILD_NUMBER} aborted* :x:\n<${JOB_URL}|${JOB_NAME}> Console:<${BUILD_URL}console|${BUILD_NUMBER}>", BRANCH_NAME ==~ /(develop|test|stage|production)/)
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
