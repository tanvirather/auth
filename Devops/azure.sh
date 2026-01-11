#!/bin/bash

################################################## variables ##################################################L
project="auth"
location="centralus"

# RESOURCE_GROUP="${BASE_NAME}-rg"
# RESOURCE_GROUP_AKS="${BASE_NAME}-aks-rg"
# RESOURCE_GROUP_NETWORK_WATCHER="NetworkWatcherRG"

################################################## functions ##################################################L
# delete_resource_groups(){
#   az group delete --name $RESOURCE_GROUP_NETWORK_WATCHER --yes 2>/dev/null
#   # az group delete --name $RESOURCE_GROUP_AKS --yes 2>/dev/null
#   # az group delete --name $RESOURCE_GROUP --yes 2>/dev/null
#   # az group create --name $RESOURCE_GROUP --location $LOCATION 1>/dev/null && echo "Resource group created : $RESOURCE_GROUP"
# }

test_service(){
  resource_group="${project}-test-rg"
  # az group delete --name $resource_group --yes 2>/dev/null
  # az group create --name $resource_group --location $location 1>/dev/null && echo "Resource group created : $resource_group"
  # az deployment group create --resource-group $resource_group --template-file biceps/web_app.bicep --parameters \
  #   location=$location \
  #   plan_name="${project}-plan" \
  #   plan_sku="F1"


  az deployment group create -g $resource_group -f biceps/web_app.bicep -p \
    org='zuhid' \
    webAppName='auth-test' \
    sku='B1' \
    slotName='staging'
}

prod_service(){
  resource_group="${project}-prod-rg"
  # az group delete --name $resource_group --yes 2>/dev/null
  # az group create --name $resource_group --location $location 1>/dev/null && echo "Resource group created : $resource_group"

  az deployment group create -g $resource_group -f biceps/web_app.bicep -p \
    org='zuhid' \
    webAppName='auth-prod' \
    sku='P0V3' \
    slotName='staging'
}

stop_service(){
  az webapp stop --resource-group auth-test-rg --name zuhid-auth-test
  az webapp stop --resource-group auth-prod-rg --name zuhid-auth-prod
  az webapp stop --resource-group auth-prod-rg --name zuhid-auth-prod --slot staging
}

start_service(){
  az webapp start --resource-group auth-test-rg --name zuhid-auth-test
  az webapp start --resource-group auth-prod-rg --name zuhid-auth-prod
  az webapp start --resource-group auth-prod-rg --name zuhid-auth-prod --slot staging
}

################################################## exec ##################################################

clear
# az login
# delete_resource_groups
# stop_service
# start_service

# test_service
# prod_service


# az deployment group create --resource-group $RESOURCE_GROUP --template-file biceps/acr.bicep --parameters @biceps/_parameters.dev.json

