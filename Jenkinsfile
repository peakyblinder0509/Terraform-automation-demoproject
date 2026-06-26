pipeline{
    agent any

    environment{
        S3_BUCKET='ikramapzz-assesment-s3'
        DISTRIBUTION_ID='E2XKG2DUHS6GBF'
    }

    stages{
        stage('checkout'){
            steps{
                git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/peakyblinder0509/Terraform-automation-demoproject.git'
            }
        }

        stage('install dependendies'){
            steps{
                sh "npm install"
            }
        }

        stage('build static files'){
            steps{
                sh "npm run build"
            }
        }

        stage('move static file to s3 bucket'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'terraform-crd']]){
                sh "/usr/local/bin/aws s3 sync dist/ s3://${S3_BUCKET} --delete"
                }
            }
        }

        stage('invalidate cloudfront cache'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'terraform-crd']]){
                sh "/usr/local/bin/aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths '/*'"
                }
            }
        }
    }
}

