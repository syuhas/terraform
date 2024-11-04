job('Terraform-EC2-Setup') {
    description('A job to set up an EC2 instance using Terraform and AWS credentials.')

    wrappers {
        // Binding AWS credentials
        credentialsBinding {
            amazonWebServicesCredentialsBinding {
                accessKeyVariable('AWS_ACCESS_KEY_ID')
                secretKeyVariable('AWS_SECRET_ACCESS_KEY')
                credentialsId('aws credentials')
            }
        }
    }

    steps {
        shell('''
            # Stage: Get the lay of the land
            echo "Current working directory:"
            pwd
            echo "Current user:"
            whoami
            echo "Workspace contents:"
            ls ${WORKSPACE}
            ls -la
            terraform --version
        ''')

        shell('''
            # Stage: Terraform EC2
            export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
            export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
            terraform init
            terraform apply -auto-approve
        ''')
    }

    // Setting environment variables directly, if needed
    environmentVariables {
        env('AWS_DEFAULT_REGION', 'us-east-1')
    }
}