#!/bin/bash

echo " Installing NGINX Ingress Controller on KIND cluster..."

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.4/deploy/static/provider/kind/deploy.yaml

echo " Waiting for ingress controller to become ready..."
kubectl wait --namespace ingress-nginx \
  --for=condition=Ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

echo " NGINX Ingress installed and ready."

