pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'prod'],
            description: 'Select environment'
        )
        choice(
            name: 'COMPONENT',
            choices: ['00-vpc', '10-sg', '20-component', '30-s3'],
            description: 'Select component to deploy'
        )
    }

    environment {
        AWS_REGION = "us-east-1"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/lakshmipriyanka96/Terraform_project_imp.git'
            }
        }

        stage('Configure AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-cred'
                ]]) {
                    sh 'aws sts get-caller-identity'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${params.COMPONENT}") {
                    sh 'terraform init'
                    
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${params.COMPONENT}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${params.COMPONENT}") {
              sh "terraform plan -var-file=env/${params.ENVIRONMENT}.tfvars -out=tfplan"
                }
            }
        }

        stage('Approval') {
            when {
                expression { params.ENVIRONMENT == 'prod' }
            }
            steps {
                input message: "Approve production deployment?"
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${params.COMPONENT}") {
                    sh "terraform apply -auto-approve -var-file=env/${params.ENVIRONMENT}.tfvars"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful"
        }
        failure {
            echo "Deployment Failed"
        }
    }
}
