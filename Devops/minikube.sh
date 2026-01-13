#!/bin/bash

################################################## variables ##################################################L


################################################## functions ##################################################L

function setup() {
  minikube delete # Deletes a local Kubernetes cluster
  minikube start # Starts a local Kubernetes cluster
  minikube addons enable metrics-server # Enable the Metrics Server Add-On
  minikube addons list # display addons
  minikube dashboard --port=39663 # Opens the Kubernetes dashboard in a browser
  # minikube tunnel # http://127.0.0.1:3000
  # az acr login --name "zuhiddev.azurecr.io" # login to Azure Container Registry
}

function namespace() {
  namespace="zuhid-namespace"
  # kubectl delete namespace $NAMESPACE  # List all namespace
  kubectl apply --filename kubernetes/namespace.yaml # Apply the file
  kubectl get namespace # List all namespace
  kubectl config set-context --current --namespace=$namespace  # Set a context entry in kubeconfig
  kubectl config view --minify --output 'jsonpath={..namespace}' # Display the current namespace
}

function deployment() {
  kubectl apply --filename kubernetes/deployment.yaml # Apply the file
  kubectl get deployments # List all deployments
  kubectl get pods # List all pods
}

function service() {
  kubectl apply --filename kubernetes/service.yaml # Apply the file
  kubectl get services # List all services
  minikube service auth-service -n zuhid-namespace --url # Get the URL of the service
}

################################################## exec ##################################################

clear
# setup
# namespace
# deployment
service
