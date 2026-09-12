targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the azd environment, used to derive resource group name and resource tokens')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
}

resource rg 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module resources 'resources.bicep' = {
  scope: rg
  params: {
    location: location
    resourceToken: resourceToken
    tags: tags
  }
}

output AZURE_CONTAINER_REGISTRY_ENDPOINT string = resources.outputs.containerRegistryEndpoint
output AZURE_CONTAINER_APPS_ENVIRONMENT_ID string = resources.outputs.containerAppsEnvironmentId
output BACKEND_URL string = resources.outputs.backendUrl
output FRONTEND_URL string = resources.outputs.frontendUrl
