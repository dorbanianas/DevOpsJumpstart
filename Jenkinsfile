pipeline {
    agent any 
    
    tools{
        jdk 'JDK17'
    }
    
    stages{
        
        stage("Git Checkout"){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/dorbanianas/devops-presentation.git'
            }
        }
        
        stage("Build"){
            steps {
                bat "mvn clean package"
            }
        }
        
        stage("Sonarqube Analysis "){
            steps{
                bat """
                    mvn sonar:sonar -Dsonar.url=http://localhost:9000/ -Dsonar.login=sqa_95faca75f100b421fae964b7cb94069cd99f6000 -Dsonar.projectName=Devops \
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
                withCredentials([string(credentialsId: '3xcelsior', variable: 'dockerhubpwd')]) {
                    bat "docker login -u 3xcelsior -p ${dockerhubpwd}"
                }
            }
        }
        
        stage("Docker push"){
            steps {
                 bat """ 
                        docker tag devopspresentation/myapp:1.0 3xcelsior/myapp 
                        docker push 3xcelsior/myapp
                    """ 
            }
        }
        
        stage("Docker run"){
            steps {
                 bat """
                        docker run -d -p 8080:8080 3xcelsior/myapp  
                    """ 
            }
        }
        
    }
}