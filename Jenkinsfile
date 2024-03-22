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
                echo "Compiling the code ${params.APPVERSION}"
                
            }

           
        }
        stage('UnitTest') {

            when{
                expression{
                    params.executeTests==true
                }
            }
            steps {
                echo "Test the code"
                
            }

           
        }
        stage('package') {
            steps {
                echo "package the code ${params.Env}"
                
            }
            stage(' DEPLOY') {
                input{
                    message "select the versrion to deploy"
                    OK "version selected"
                    parameters{
                        choice(name:'PLATFORM',choices['EKS','K8s','SERVERS'])
                    }
                }
            steps {
                echo "Deploy the code ${params.Env}"
                
            }
           
        }
    }
}
