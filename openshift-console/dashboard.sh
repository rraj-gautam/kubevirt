#!/bin/bash

export KUBECONFIG=/etc/kubernetes/admin.conf
cd /root/openshift-console/console
source contrib/environment.sh
./bin/bridge

exit 0
