RGROUP="rg-adrien-sigur-prf2026"
REGION="francecentral"
az webapp create \
  --name "api-appservice-AdrienSigur" \
  --resource-group $RGROUP \
  --plan "plan-npr-prf2026" \
  --runtime "PHP:8.2"

az storage account create \
  --name "storageaccountadrien" \
  --resource-group $RGROUP \
  --location $REGION \
  --sku Standard_LRS \
  --kind StorageV2

az functionapp create \
  --name "api-func-AdrienSigur" \
  --resource-group $RGROUP \
  --runtime "java" \
  --flexconsumption-location "francecentral" \
  --storage-account "storageaccountadrien"
