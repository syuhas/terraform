pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1',
        AWS_ACCESS_KEY_ID = credentials('aws credentials'),
        AWS_SECRET_ACCESS_KEY = credentials('aws credentials')
    }

    stages {
        stage('TerraformEc2') {
            withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws credentials',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {

            }
        }
    }
}