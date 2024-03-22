pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
    parameters { 
    string(name: 'Env', defaultValue: 'Test', description: 'version to display') 
    booleanParam(name: 'executeTests', defaultValue: true, description: 'decide to run tc')
    choice(name: 'APPVERSION', choices: ['1.1', '1.2', '1.3'])
    }
    stages {
        stage('compile') {
            steps {
                echo "Compiling the code ${params.APPVERSION}"
                
            }

           
        }
        stage('UnitTest') {
            steps {
                echo "Test the code"
                
            }

           
        }
        stage('package') {
            steps {
                echo "package the code ${params.Env}"
                
            }

           
        }
    }
}
