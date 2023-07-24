targetScope = 'resourceGroup'

// ----------
// PARAMETERS
// ----------

@description('The Azure location to deploy to.')
param location string = resourceGroup().location

// ---------
// VARIABLES
// ---------

// ---------
// RESOURCES
// ---------

@description('Azure Firewall Hub')
module baseline_hub_network '../modules/hubNetworking.bicep' = {
  name: 'baseline_hub_network'
  params: {
    parLocation: location
    parPublicIpSku: 'Standard'
    parAzFirewallAvailabilityZones: [
      '1'
      '2'
      '3'
    ]
    parAzErGatewayAvailabilityZones: [
      '1'
      '2'
      '3'
    ]
    parAzVpnGatewayAvailabilityZones: [
      '1'
      '2'
      '3'
    ]
    parVpnGatewayConfig: {}
    parExpressRouteGatewayConfig: {}
  }
}
