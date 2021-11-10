
#apply the docker sourced task to each namespace
#the protected namespace will fail to build, the regular one will succeed.
oc project as-build
oc apply -f tasks-docker.io
sh cli/run.sh

oc project as-build-protected
oc apply -f tasks-docker.io
sh cli/run.sh
 