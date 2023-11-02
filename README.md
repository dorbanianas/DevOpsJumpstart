# Getting Started with MyApp

This guide will walk you through the steps to build and deploy MyApp using Maven, Docker, and Kubernetes.

## Prerequisites

Before you begin, make sure to have the following tools and utilities installed on your system:

- [Maven](https://maven.apache.org/)
- [Docker](https://www.docker.com/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [minikube](https://minikube.sigs.k8s.io/)

## Building the Application

1. Clone the project from the repository:
    
    ```bash
    git clone https://github.com/dorbanianas/devops-presentation
    ```
    
2. Navigate to the project directory:
    
    ```bash
    cd devops-presentation
    ```
    
3. Clean the project to remove any previous build artifacts:
    
    ```bash
    mvn clean
    ```
    
4. Build the application package:
    
    ```bash
    mvn package
    ```
    

## **Building and Pushing Docker Image**

1. Log in to your Docker Hub account or your preferred container registry:
    
    ```bash
    docker login
    ```
    
2. Build a Docker image for MyApp, giving it a name and version tag (e.g., `devopspresentation/myapp:1.0`):
    
    ```bash
    docker build -t devopspresentation/myapp:1.0 .
    ```
    
3. Push the Docker image to Docker Hub:
    
    ```bash
    docker push devopspresentation/myapp:1.0
    ```
    
4. Verify that the Docker image has been successfully built:
    
    ```bash
    docker images
    ```
    

## **Deploying to Kubernetes**

1. Apply the Kubernetes deployment configuration to deploy MyApp using minikube:
    
    ```bash
    minikube start
    ```
    
2. Apply the Kubernetes deployment configuration to deploy MyApp:
    
    ```bash
    kubectl apply -f deployment.yaml
    ```
    
3. Check the nodes in your Kubernetes cluster:
    
    ```bash
    kubectl get nodes -o wide
    ```
    
4. View the deployments in your cluster:
    
    ```bash
    kubectl get deployments
    ```
    
5. Check the pods created by the deployment:
    
    ```bash
    kubectl get pods
    ```
    
6. Access the logs of all the pods if needed using the following script:
    
    ```bash
    ./get_pods_logs.sh
    ```
    
7. Apply the Kubernetes service configuration to expose the application:
    
    ```bash
    kubectl apply -f service.yaml
    ```
    
8. Check the services available in your cluster:
    
    ```bash
    kubectl get service
    ```
    
9. Verify the nodes and their details:
    
    ```bash
    kubectl get nodes -o wide
    ```
    
10. Access your application by obtaining the external IP of the service using the following script:
    
    ```bash
    ./get_app_url.sh
    ```
