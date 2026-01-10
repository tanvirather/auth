#!/bin/bash

################################################## variables ##################################################L
BASE_NAME="zuhid"
LOCATION="centralus"

RESOURCE_GROUP="${BASE_NAME}-rg"
RESOURCE_GROUP_AKS="${BASE_NAME}-aks-rg"
RESOURCE_GROUP_NETWORK_WATCHER="NetworkWatcherRG"

################################################## functions ##################################################L
refresh_resource_groups(){
  az group delete --name $RESOURCE_GROUP_NETWORK_WATCHER --yes 2>/dev/null
  az group delete --name $RESOURCE_GROUP_AKS --yes 2>/dev/null
  az group delete --name $RESOURCE_GROUP --yes 2>/dev/null
  az group create --name $RESOURCE_GROUP --location $LOCATION 1>/dev/null && echo "Resource group created : $RESOURCE_GROUP"
}

################################################## exec ##################################################

clear
# az login
# refresh_resource_groups
az deployment group create --resource-group $RESOURCE_GROUP --template-file biceps/acr.bicep --parameters @biceps/_parameters.dev.json

