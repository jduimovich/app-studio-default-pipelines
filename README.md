# app-studio-default-pipelines

This repository contains some sample pipelines for a default container build and push.

The repository demonstrates three options

1. Using gitops to install pipelines in a namespace.
2. Manually installing pipelines using oc apply
3. Manually configuring a pipeline environment to support policy and restrictions 

To run these examples, you need to install Openshift Pipelines, Openshift Gitops and Gatekeeper Operator from the console. 

## Running the Gitops Example 
To link this repository simply run 
```
oc apply -f gitops
```

This will set up an application whic will sync the `pipelines` directory in this repo to the cluster.
To add new tasks or pipelines or policy, add the manifests to the pipelines directory.

To run a build in this namespace

``` 
cli\run.cmd
```

You can also modify the runners yaml manually and use `oc apply -f runners -n as-build-gitops`.

To use the internal registry set the image to `image-registry.openshift-image-registry.svc:5000/as-build-gitops/a-simple-app`


## Running the Unrestricted Build 

Create namespaces and install pipelines. 
```
oc new-project as-build
oc apply -f pipelines
```
To run a build in this namespace

``` 
cli\run.cmd
```

You can also modify the runners yaml manually and use `oc apply -f runners -n as-build`.

To use the internal registry set the image to `image-registry.openshift-image-registry.svc:5000/as-build/a-simple-app`

## Running the  Build with Policy Installed

Create namespaces and install pipelines and policy 
```
oc new-project as-build-protected
oc apply -f pipelines
oc apply -f policy\repo-white-list   
```
To run a build in this namespace

``` 
cli\run.cmd
```
This initial namespace is runnin pipelines which are all pulling containers from approved registries. Or use 
To use the internal registry set the image to `image-registry.openshift-image-registry.svc:5000/as-build-protected/a-simple-app`

To demonstrate policy enforcement install a task which has a reference to a non-approved location.
```
oc apply -f tasks-docker.io -n as-build-protected
```

Re-run the build `cli\run.cmd` and you will see an error as the namespace is protected from loading containers from the docker.io registry.



