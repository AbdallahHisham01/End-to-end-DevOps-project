# Automating Deployment of MERN Stack App on Kubernetes

This project automates the full deployment pipeline for a MERN (MongoDB, Express, React, Node.js) stack application on a Kubernetes cluster using infrastructure-as-code and DevOps tools.

## 🚀 Project Structure

```
├── ansible/ # Ansible scripts to install and configure Jenkins
├── backend/ # Node.js backend (Express.js + MongoDB)
├── frontend/ # React frontend
├── k8s/ # Kubernetes manifests for MongoDB, backend, frontend, and ingress
├── terraform/ # Terraform files to provision the infrastructure (e.g., on AWS)
├── kubespray/ # Kubespray for provisioning Kubernetes cluster
├── Jenkinsfile* # CI/CD pipelines (one for build, one for image building)
├── nginx-controller.sh # Script for installing NGINX ingress controller
├── config # stores ssh shared configurations
```


## 🛠 Tools & Technologies

- **Terraform** – Infrastructure provisioning (e.g., AWS)
- **Kubespray** – Deploys Kubernetes clusters
- **Ansible** – Automates Jenkins installation and configuration
- **Jenkins** – CI/CD pipeline execution
- **Docker** – Containerization of frontend and backend
- **Kubernetes** – Container orchestration
- **NGINX Ingress Controller** – Manages ingress traffic
- **MongoDB** – NoSQL database for the backend

## 🔄 CI/CD Workflow

1. **Terraform** provisions the infrastructure.
2. **Kubespray** sets up the Kubernetes cluster.
3. **Ansible** installs Jenkins on a control node.
4. **Jenkinsfile** runs:
   - Build and test React and Node.js apps
   - Dockerize both apps and push to Docker Hub
   - Apply Kubernetes manifests for deployment
5. **NGINX ingress** routes traffic to frontend/backend apps.

## 🧪 How to Use

### 1. Provision Infrastructure
```bash
cd terraform/
terraform init
terraform apply
```

## 2. Set Up Kubernetes Cluster
  Use kubespray to setup kubernetes structure in kubeadm flavor and choose your cni

## 3. Install Jenkins
  Use ansible playbook to install and configure jenkins to work on ec2

## 4. Configure Jenkins
  - Add required credentials (Docker Hub, GitHub, etc.)
  
  - Configure pipelines using Jenkinsfile and Jenkinsfile-imagebuilder

## 5. Deploy Application
   Use jenkins pipeline to deploy kubernetes application and install and configure nginx ingress controller

## 📁 Frontend and Backend

- **frontend/** contains a full React app with its own Dockerfile.
- **backend/** includes the Express.js server, routes, and models, also with a Dockerfile.

## 📦 Kubernetes Components

In the `k8s/` folder:

- Deployments and Services for MongoDB, backend, and frontend
- Persistent Volumes and Claims
- Ingress configuration

## 📌 Notes

- Ensure `kubectl` and `terraform` are configured correctly for your environment.
- Docker and Jenkins must be able to push/pull images to/from your registry.
- You can extend this setup with monitoring (e.g., Prometheus/Grafana), logging, and secrets management.
## 🧑‍💻 Author

  This project was developed by [Abdallah Hisham Hamed](https://github.com/AbdallahHisham01) as part of a DevOps learning journey.

