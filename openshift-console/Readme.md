Before running dhasboard.sh with proper file locations

Run following commands:

`kubectl create serviceaccount console -n kube-system`

`kubectl create clusterrolebinding console --clusterrole=cluster-admin --serviceaccount=kube-system:console -n kube-system`

ensure following in envrionment.sh
vi contrib/environment.sh  --->   `secretname=$(kubectl get serviceaccount console --namespace=kube-system -o jsonpath='{.secrets[0].name}')`
