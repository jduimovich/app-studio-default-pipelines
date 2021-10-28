# app-studio-default-pipelines

This repository contains some sample pipelines for a default container build and push.

The repository demonstrates three options

1. Using gitops to install pipelines in a namespace.
2. Manually installing piplines using oc apply
3. Manually configuring a pipeline environment to support policy and restrictions 

To run these examples, you need to install Openshift Pipelines, Openshift Gitops and Gatekeeper Operator from the console. 

# Running the Gitops Example 
To link this repository simply run 
```
oc apply -f gitops
```

This will set up an application whic will sync the `pipelines` directory in this repo to the cluster.
To add new tasks or pipelines or policy, add the manifests to the pipelines directory.

# Running the Unrestricted Build 

Create namespaces and install pipelines. 
```
oc new-project as-build
oc apply -f pipelines
```
To run a build in this namespace

``` 
oc create -f runners -n as-build
```
# Running the  Build with Policy Installed

Create namespaces and install pipelines and policy 
```
oc new-project as-build-protected
oc apply -f pipelines
oc apply -f policy\repo-white-list   
```
To run a build in this namespace

``` 
oc create -f runners -n as-build-protected
```
This initial namespace is runnin pipelines which are all pulling containers from approved registries.

To demonstrate policy enforcement install a task which has a reference to a non-approved location.
```
oc apply -f tasks-docker.io -n as-build-protected
```

Re-run the build `oc create -f runners -n as-build-protected` and you will see an error as the namespace is protected from loading containers from the docker.io registry.



