#!/bin/bash

# minikube start --vm-driver=none
echo 'BUILDING DOCKER CONTAINER'
docker build -t adjust:latest .
echo 'DEPLOYING TO K8S WITH HELM'
helm upgrade --install adjust --wait -f values.yaml helm_chart
echo 'TEST'
kubectl run -i --tty test --image=adjust:latest --rm --image-pull-policy='Never' --restart=Never --command -- curl adjust.default.svc.cluster.local | grep 'Well, hello there' && echo 'SITE WORKS'
