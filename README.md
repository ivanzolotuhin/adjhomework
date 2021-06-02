# http_server
A dead simple Ruby web server.
Serves on port 80.
/healthcheck path returns "OK"
All other paths return "Well, hello there!"

`$ ruby webserver.rb`

# Requirements
1) kubectl
2) helm3
3) docker

# Fixes
I have added 3 lines of code into http_server.rb to make it compatible with HTTP1.1 protocol, otherwise more complex workarounds required to enable healthcheck.
# Start minikube and config default profile
minikube started with this command
`minikube start --vm-driver=none`
default namespace in use for simplify the task

# Run cicd.sh from repo root folder.
what script does:
build docker container adjust:latest on localhost
deploy it with helm chart `./helm_chart`: 3 replicas and healthcheck enabled. Service should be available withing the k8s as adjust.default.svc.cluster.local FQDN.
Run test. It runs the same container adjust:latest, because it have built-in curl command, run `curl adjust.default.svc.cluster.local` and print ok if grep lines "Well, hello there"

# Consideration
Because there is no mention about ingress, open public port or use HPA, there is no port accessible outside K8S and there is no autoscaling implemented.
