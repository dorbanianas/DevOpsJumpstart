# Getting Started with MyApp

This guide will walk you through the steps to build and deploy MyApp using Maven, Docker, and Kubernetes.

## Prerequisites

Before you begin, ensure that you have the following tools installed on your system:

- [Maven](https://maven.apache.org/)
- [Docker](https://www.docker.com/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

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
    
2. Build a Docker image for MyApp, giving it a name and version tag (e.g., **`devopspresentation/myapp:1.0`**):
    
    ```bash
    docker build -t devopspresentation/myapp:1.0 .
    ```
    
3. Verify that the Docker image has been successfully built:
    
    ```bash
    docker images
    ```
    

## **Deploying to Kubernetes**

1. Apply the Kubernetes deployment configuration to deploy MyApp:
    
    ```bash
    kubectl apply -f deployment.yaml
    ```
    
2. Check the nodes in your Kubernetes cluster:
    
    ```bash
    kubectl get nodes -o wide
    ```
    
3. View the deployments in your cluster:
    
    ```bash
    kubectl get deployments
    ```
    
4. Check the pods created by the deployment:
    
    ```bash
    kubectl get pods
    ```
    
5. Access the logs of specific pods if needed (replace Pod names with actual pod names):
    
    ```bash
    kubectl logs my-app-7bd7b886d8-4h6nw
    kubectl logs my-app-7bd7b886d8-gkdz7
    ```
    
6. Apply the Kubernetes service configuration to expose the application:
    
    ```bash
    kubectl apply -f service.yaml
    ```
    
7. Check the services available in your cluster:
    
    ```bash
    kubectl get service
    kubectl get svc
    ```
    
8. Verify the nodes and their details:
    
    ```bash
    kubectl get nodes -o wide
    ```
    
9. Access your application by obtaining the external IP of the service, if it's a cloud-based cluster, or by using NodePort or other service type defined in your **`service.yaml`**.