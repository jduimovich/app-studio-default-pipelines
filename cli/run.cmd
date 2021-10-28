 
@echo off 

oc config view --minify -o "jsonpath={..namespace}"  >openshift.ns
set /P NS=< openshift.ns
del openshift.ns
Set NS=%NS:"=%

SET IMG=image-registry.openshift-image-registry.svc:5000/%NS%/a-simple-app
echo Starting a Build
echo Image: %IMG%
echo Namespace: %NS% 

yq -M e ".spec.params[1].value = \"%IMG%\"" %CD%\runners\run-basic-clone-push.yaml | oc create -f -

