
oc project as-build
oc apply -f tasks-docker.io
call %CD%\cli\run.cmd  

oc project as-build-protected
oc apply -f tasks-docker.io
call %CD%\cli\run.cmd  
 