oc project as-build
tkn pipelineruns delete --all 
oc delete -f ..\pipelines
oc apply -f ..\pipelines

oc project as-build-protected
tkn pipelineruns delete --all 
oc delete -f ..\pipelines
oc apply -f ..\pipelines 