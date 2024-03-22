pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
    parameters { 
    string(name: 'Env', defaultValue: 'Test', description: 'version to display') 
    booleanParam(name: 'executeTests', defaultValue: true, description: 'decide to run testcase')
    choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'])
    }
    stages {
        stage('compile') {
            steps {
                script{
                echo "Compiling the code ${params.APPVERSION}"
                sh 'mvn compile'
                }
            }

           
        }
        stage('UnitTest') {

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
            steps {
                script{
            echo "package the code ${params.Env}"
                sh 'mvn package'
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
