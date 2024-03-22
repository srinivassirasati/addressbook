pipeline {
    agent none

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
    parameters { 
    string(name: 'Env', defaultValue: 'Test', description: 'version to display') 
    booleanParam(name: 'executeTests', defaultValue: true, description: 'decide to run testcase')
    choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'])
    }

    enviornment {
        PACKAGE_SERVER = 'ec2-user@172.31.1.202'
    }

    stages {
        stage('compile') {
            agent {label 'linux_slave'}
            steps {
                
                echo "Compiling the code ${params.APPVERSION}"
                sh 'mvn compile'
                
            }

           
        }
        stage('UnitTest') {
            agent any
            when{
                expression{
                    params.executeTests==true
                }
            }
            steps {
                script{
                echo "Test the code"
                sh 'mvn test'
            }
            }

           
        }
        stage('package') {
            agent any
            steps {
                script{
                    sshagent(['slave2']) {
            echo "package the code ${params.Env}"
                sh "scp -o StrictHostKeyChecking=no server-config.sh ${PACKAGE_SERVER}:home/ec2-user"
                sh "ssh -o StrictHostKeyChecking=no ${PACKAGE_SERVER} 'bash ~/server-config.sh'"
                
                }
                
            }
            }
        }
            stage('DEPLOY') {
               input {
                message "select platform to display"
                ok "platform selected"
                
                parameters {
                    choice(name:'PLATFORM', choices:['EKS','K8S','SERVERS'])
                }
               }
            steps {
                echo "Deploy the code ${params.Env}"
                
            }
           
        }
    }
}
