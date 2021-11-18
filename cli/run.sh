export NS=$(oc config view --minify -o "jsonpath={..namespace}")
export IMG=image-registry.openshift-image-registry.svc:5000/$NS/a-simple-app
echo "Namespace: " $NS
echo "Image: " $IMG

export REP='"'$IMG'"'
echo $REP

yq -M e ".spec.params[1].value=\"$IMG\"" runners/run-basic-clone-push.yaml
yq -M e ".spec.params[1].value=\"$IMG\"" runners/run-basic-clone-push.yaml | oc create -f -

