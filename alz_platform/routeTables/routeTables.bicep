targetScope = 'subscription'
// ALZ Spoke Tables
// ----------
// PARAMETERS
// ----------
@sys.description('The current date:time for tag creation stamps.')
param dateTime string = utcNow()

@description('The Primary Azure location to deploy to.')
param region string = 'uksouth'

@description('The Short hand Primary Azure location to deploy to.')
param regionSH string = 'uks'

@description('Company Prefix to add to resource names')
param companyPrefix string = 'rios'

// ---------
// RESOURCES
// ---------

module devRouteTable '../modules/routeTable.bicep' = {
  name: 'devRouteTable'
  scope: resourceGroup('rg-rios-uks-hub-prod')
  params: {
    name: 'rt-${companyPrefix}-${regionSH}-testing-dev'
    location: region
    routes: []
    tags: {
      ApplicationName: 'Route Table'
      DR: 'Dev'
      Owner: 'Dan'
      Env: 'Dev'
      Created: dateTime
    }
  }
}

module coreRouteTable '../modules/routeTable.bicep' = {
  name: 'coreRouteTable'
  scope: resourceGroup('rg-rios-uks-core-prod')
  params: {
    name: 'rt-${companyPrefix}-${regionSH}-core-prod'
    location: region
    routes: []
    tags: {
      ApplicationName: 'Route Table'
      DR: 'Prod'
      Owner: 'Dan'
      Env: 'Prod'
      Created: dateTime
    }
  }
}
