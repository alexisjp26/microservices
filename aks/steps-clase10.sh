az login

#Crear Service Principal
az ad sp create-for-rbac --name ucreativa_microservicios
az logout
az login --service-principal \
         --username *******************  \
         --password "************************"  \
         --tenant ******************************
#Crear grupo de recursos, para agrupamiento logico 
az group create -l eastus2 -n dev-clase10-rg
#Crear registry container
az acr create --resource-group dev-clase10-rg --name ucreativaregistryclase10 --sku Basic
#Se le hace build a la imagen desde el dockerfile y se taggea 
docker build --tag ucreativaregistryclase10.azurecr.io/holatest:1.0.0 .
#Login al container registry
az acr login --name ucreativaregistryclase10
#Haga push de la imagen al registry
docker push ucreativaregistryclase10.azurecr.io/holatest:1.0.0
#Crea el cluster y le ponemos un nodepool label
az aks create -g dev-clase10-rg -n Clase10Cluster --node-count 1 --nodepool-labels "processing=aqui" --service-principal "**************" --client-secret "*********************"
#Traer .config para usar kubectl
az aks get-credentials -g dev-clase10-rg -n Clase10Cluster
#Aplicar el deployment
kubectl apply -f aks/hola-deploymentAZ.yml
#Agregar otro Nodepool
az aks nodepool add --resource-group dev-clase10-rg \
                    --cluster-name Clase10Cluster \
                    --name otro \
                    --node-count 1
#Aplicar el deployment luego de subir la cantidad de replicas
kubectl apply -f aks/hola-deploymentAZ.yml
kubectl apply -f aks/otro-deploymentAZ.yml

az group delete -n dev-clase10-rg 