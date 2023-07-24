targetScope = 'resourceGroup'

metadata name = 'ALZ Bicep - Spoke Networking module'
metadata description = 'This module creates spoke networking resources'

@sys.description('The current date:time for tag creation stamps.')
param dateTime string = utcNow()

@sys.description('Azure region for the spoke network.')
param location string = 'uksouth'

module coreSpoke 'br:mcr.microsoft.com/bicep/network/virtual-network:1.1.2' = {
  name: 'coreSpokeDeploy'
  scope: resourceGroup('00000000-0000-0000-0000-000000000000','rg-example-uks-core-prod')
  params: {
    name: 'vnet-example-uks-core-prod' //vnet name
    location: location
    addressPrefixes: [
      '10.0.2.0/23'
    ]
    subnets: [
      {
        name: 'snet-example-uks-core-prod'
        addressPrefix: '10.0.2.0/24'
      }
      {
        name: 'snet-example-uks-idty-dev'
        addressPrefix: '10.0.3.0/28'
      }
    ]
    virtualNetworkPeerings: [
      {
        remoteVirtualNetworkId: '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example-uks-hub-prod/providers/Microsoft.Network/virtualNetworks/vnet-example-uks-hub-prod'
        allowForwardedTraffic: true
        allowGatewayTransit: false
        allowVirtualNetworkAccess: true
        useRemoteGateways: false
        remotePeeringEnabled: true
        remotePeeringName: 'coreToHub'
        remotePeeringAllowVirtualNetworkAccess: true
        remotePeeringAllowForwardedTraffic: true
      }
    ]
    newOrExistingNSG: 'new'
    networkSecurityGroupName: 'nsg-example-uks-core-prod'
    tags: {
      ApplicationName: 'Core'
      DR: 'Prod'
      Owner: 'Dan Rios'
      Env: 'Prod'
      Created: dateTime
    }
  }
}
