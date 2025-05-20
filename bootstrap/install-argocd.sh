#!/bin/bash

echo " Installing ArgoCD in the 'argocd' namespace..."

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo " Waiting for ArgoCD server to become ready..."
kubectl wait --for=condition=Available deployment/argocd-server -n argocd --timeout=180s

echo " ArgoCD installed and ready to use."

