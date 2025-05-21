pipeline {
    agent any
    
    environment {
        KUBECONFIG = '/var/lib/jenkins/kubeconfig' 
    }

    stages {
        stage("Create mern namespace") {
            steps {
                sh "kubectl namespace get mern || kubectl create namespace mern"
            }
        }
        stage('Deploy PV and PVC') {
            steps {
                sh 'kubectl apply -f k8s/pv.yml'
                sh 'kubectl apply -f k8s/pvc.yml'
                sh 'kubectl apply -f k8s/mongo-dep.yml'
                sh 'kubectl apply -f k8s/mongo-svc.yml'
            }
        }
        stage('Deploy Backend') {
            steps {
                sh 'kubectl apply -f k8s/express-dep.yml'
                sh 'kubectl apply -f k8s/express-svc.yml'
            }
        }
        stage('Deploy Frontend') {
            steps {
                sh 'kubectl apply -f k8s/react-dep.yml'
                sh 'kubectl apply -f k8s/react-svc.yml'
            }
        }
        stage('Deploy Ingress Rules') {
            steps {
                sh 'kubectl apply -f k8s/ingree.yml'
            }
        }
        stage('Deploy Ingress contoller') {
            steps {
                sh './nginx-controller.sh'
            }
        }
    }

    post {
        success {
            echo 'All Kubernetes manifests deployed successfully.'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
