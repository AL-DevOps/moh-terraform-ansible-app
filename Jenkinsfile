pipeline {
    agent {
       label "built-in"
    } 
    stages {
        stage('Checkout code') {
            steps {
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub-User-Pass', url: 'https://github.com/AL-DevOps/moh-terraform-ansible-app.git']]]) 
            }
        }
        stage('Terraform apply') {
            steps {
			    sh '''
			        terraform init
                    terraform apply --auto-approve
			}    '''
        }    
		stage(" execute Ansible version") {
		    steps {
                sh '''ansible --version'''
			}	
        }   
/*
        stage(" execute Ansible Appashe") {
		    steps {
                ansiblePlaybook credentialsId: 'ansible-andrey-key-frankfurt', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'host', playbook: 'playbook.yaml'
            }
        } 
*/		
    }
}
