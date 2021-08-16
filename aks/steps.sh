az login

#Crear Service Principal
az ad sp create-for-rbac --name ucreativa_microservicios
az logout
az login --service-principal \
         --username *******************  \
         --password "************************"  \
         --tenant ******************************
#Crear grupo de recursos, para agrupamiento logico 
az group create -l eastus2 -n dev-clase09-rg
#Crear Cluster 
az aks create -g dev-clase09-rg -n AlexisCluster --node-count 2
#Traer .config para usar kubectl
az aks get-credentials -g dev-clase09-rg -n AlexisCluster
#Reducir el node-count del cluster a 1 nodo.
az aks nodepool scale --cluster-name AlexisCluster --name nodepool1 --resource-group dev-clase09-rg --node-count 1
#Agregar otro Nodepool
az aks nodepool add \
    --resource-group dev-clase09-rg \
    --cluster-name AlexisCluster \
    --name otroPool \
    --node-count 1
#Crea el deployment
kubectl apply -f k8s/hola-deployment.yml
#Crea el service
kubectl apply -f k8s/hola-svc.yml
#Obtener IP Publica del svc
kubectl get svc
#Borrar cluster
az aks delete -n AlexisCluster -g dev-clase09-rg
#Elimina Resource Group
az group delete -n dev-clase09-rg
