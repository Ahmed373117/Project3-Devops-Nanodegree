#!/usr/bin/env bash
# This tags and uploads an image to Docker Hub
# Step 1:
# This is your Docker ID/path
# dockerpath=<>
DOCKERPATH=ahmedadelelshorafa/house_prediction
TAG=prediction

# Step 2
# Run the Docker Hub container with kubernetes
#minikube kubectl -- create deployment prediction --image=$DOCKERPATH
kubectl run $TAG --image=$DOCKERPATH --generator=run-pod/v1

# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/prediction-fdbc758bd-8pwph 8000:80

#kubectl expose -h pod/$TAG  --port=8000 --target-port=80