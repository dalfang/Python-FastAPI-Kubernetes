# Simple Python FastAPI Kubernetes Getting Started

This project demonstrates how to containerize a FastAPI application and deploy it to a local Kubernetes cluster using Minikube.

## Features

- FastAPI application (`app/main.py`)
- Dockerfile for building the app image
- Kubernetes Deployment and Service YAML (`deployment.yaml`)
- Environment variable configuration for the app
- Instructions for local development and testing

## Prerequisites

- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Git](https://git-scm.com/)

## Quick Start

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/k8s-getting-started.git
   cd k8s-getting-started
   ```

2. **Build and push the Docker image**
   ```sh
   docker build -t yourdockerhubusername/k8s-getting-started:latest .
   docker push yourdockerhubusername/k8s-getting-started:latest
   ```

3. **Start Minikube**
   ```sh
   minikube start
   ```

4. **Load the image into Minikube (if built locally)**
   ```sh
   minikube image load yourdockerhubusername/k8s-getting-started:latest
   ```

5. **Deploy to Kubernetes**
   ```sh
   kubectl apply -f deployment.yaml
   ```

6. **Access the app**
   - Using NodePort:
     ```sh
     minikube service fastapi-service
     ```
   - Or port-forward:
     ```sh
     kubectl port-forward service/fastapi-service xxxxx

