oc project as-build
tkn pipelineruns delete --all 
oc delete -f %CD%\pipelines
oc apply -f %CD%\pipelines

oc project as-build-protected
tkn pipelineruns delete --all 
oc delete -f %CD%\pipelines
oc apply -f %CD%\pipelines 
oc delete -f %CD%\policy\repo-white-list 
oc apply -f policy\repo-white-list\template.yaml
oc apply -f policy\repo-white-list\constraint.yaml