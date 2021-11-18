
oc project as-build-gitops
tkn pipelineruns delete --all -f

oc project as-build
tkn pipelineruns delete --all  -f
oc delete -f pipelines
oc apply -f pipelines

oc project as-build-protected
tkn pipelineruns delete --all  -f
oc delete -f pipelines
oc apply -f pipelines 
oc delete -f  policy/repo-white-list 
oc apply -f policy/repo-white-list/template.yaml
oc apply -f policy/repo-white-list/constraint.yaml

