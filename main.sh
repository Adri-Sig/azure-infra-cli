RGROUP="rg-adrien-sigur-prf2026"
REGION="francecentral"

# Create webapp
az webapp create \
  --name "api-appservice-AdrienSigur" \
  --resource-group $RGROUP \
  --plan "plan-npr-prf2026" \
  --runtime "PHP:8.2"

#Storage account
az storage account create \
  --name "storageaccountadrien" \
  --resource-group $RGROUP \
  --location $REGION \
  --sku Standard_LRS \
  --kind StorageV2

# Function app create
az functionapp create \
  --name "api-func-AdrienSigur" \
  --resource-group $RGROUP \
  --runtime "python" \
  --storage-account "storageaccountadrien" \
  --plan "/subscriptions/5e683e0f-b00c-48d6-9769-5aaf598de8f1/resourceGroups/rg-shared-prf2026/providers/Microsoft.Web/serverfarms/plan-npr-prf2026"

# Container create
az container create \
  -g rg-adrien-sigur-prf2026 \
  --name "api-aci-adriensigur" \
  --image mcr.microsoft.com/azuredocs/aci-helloworld \
  --ports 80 \
  --os-type linux \
  --memory 1.5 \
  --cpu 1
