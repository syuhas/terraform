pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['Deploy', 'Destroy'], description: 'Choose an action to perform: Deploy or Destroy EC2 Resources')
    }

    stages {
        stage('Getthelayoftheland') {
            steps {
                sh 'pwd && whoami'
                sh 'ls ${WORKSPACE}'
                sh 'ls -la'
                sh 'terraform --version'
            }
        }
        stage('DeployEc2') {
            when {
                expression (params.ACTION == 'Deploy')
            }
            steps {
                withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws credentials',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'terraform init'
                    sh 'terraform plan -out=plan.tfplan'
                    sh 'terraform apply -auto-approve plan.tfplan'
                    script {
                        env.INSTANCE_ID = sh(script: 'terraform output -raw instance_id', returnStdout: true).trim()
                        env.PUBLIC_IP = sh(script: 'terraform output -raw instance_public_ip', returnStdout: true).trim()
                        env.PUBLIC_DNS = sh(script: 'terraform output -raw instance_public_dns', returnStdout: true).trim()
                        env.INSTANCE_NAME = sh(script: 'terraform output -raw instance_name', returnStdout: true).trim()
                    }
                    sh 'echo "Instance ID: ${INSTANCE_ID}"'
                    sh 'echo "Public IP: ${PUBLIC_IP}"'
                    sh 'echo "Public DNS: ${PUBLIC_DNS}"'
                    sh 'echo "Instance Name: ${INSTANCE_NAME}"'
                }
            }
        }

        stage('DestroyEc2') {
            when {
                expression (params.ACTION == 'Destroy')
            }
            steps {
                withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws credentials',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
        // stage('ServerSetup') {
        //     steps {
        //         sshagent(['ec2']) {
        //             sh 'cat '
        //         }
        //     }
        // }
    }
}