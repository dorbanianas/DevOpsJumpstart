pipeline {
    agent any 
    
    tools{
        jdk 'JDK21'
        maven 'Maven3'
    }
    
    stages{
        
        stage("Git Checkout"){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/dorbanianas/devops-presentation.git'
            }
        }
        
        stage("Build"){
            steps {
                sh "mvn clean package"
            }
        }
        
        stage("Sonarqube Analysis "){
            steps{
                sh """
                    mvn sonar:sonar -Dsonar.url=http://localhost:9000/ -Dsonar.login=squ_72258a66a1bdd1e1e12c47858ca2d253ceb758ad -Dsonar.projectName=Devops \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Devops
                """
            }
        }
        // stage("Docker build "){
        //     steps{
        //         bat "docker build -t devopspresentation/myapp:1.0 ."
        //     }
        // }
        
        stage("Docker login"){
            steps {
                withCredentials([string(credentialsId: 'dockerpresentation', variable: 'dockerhubpwd')]) {
                    sh "docker login -u dockerpresentation -p ${dockerhubpwd}"
                }
            }
        }
        
        stage("Docker push"){
            steps {
                 sh """ 
                        docker tag devopspresentation/myapp:1.0 dockerpresentation/myapp 
                        docker push dockerpresentation/myapp
                    """ 
            }
        }
        
        stage("Docker run"){
            steps {
                 sh """
                        docker stop myapp 
                        docker rm myapp 
                        docker run --name myapp -d -p 8000:8080 dockerpresentation/myapp  
                    """ 
            }
        }
        
    }
}