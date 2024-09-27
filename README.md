# Installing steps:
* install flux cli
```
	curl -s https://fluxcd.io/install.sh | sudo bash
```
* install flux on Kubernetes
```
    flux install --namespace flux-system
```
* verify the installation
```
	kubectl get pods -n flux-system
```
* Create a Namespace for Your Helm Release
```
	kubectl create ns nginx
```
* Create a Secret for AWS ECR Authentication:
```
    kubectl create secret generic ecr-auth \
    --namespace flux-system \
    --from-literal=username=AWS \
    --from-literal=password=$(aws ecr get-login-password --region <aws region>)
```
* Apply the helm repository creation. 
```
    kubectl apply -f helm-repo-ecr.yaml
    kubectl get ocirepository -n flux-system
```
* Create helm repository for the deployment in nginx namespace
```
    kubectl apply -f helm-release.yaml
    kubectl cget helmrelease -n nginx
```
* check the release in nginx namespcae

Note: helm.yml is the pipeline in githubactions.

# Test process
To test the process:
1- set a upper version in file `verison`
2- commit and push the changes
3- github actions should follow the helm.yml pipeline
