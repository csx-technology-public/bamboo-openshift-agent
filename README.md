oc create imagestream bamboo-openshift-agent
oc process -f ./bamboo-openshift-agent.yml | oc apply -f-