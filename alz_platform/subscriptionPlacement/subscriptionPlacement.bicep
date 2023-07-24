targetScope = 'managementGroup'

metadata name = 'ALZ Bicep - Subscription Placement module'
metadata description = 'Module used to place subscriptions in management groups'

module connectivitySubPlacement '../modules/subscriptionPlacement.bicep' = {
  name: 'connectivitySubPlacement'
  params: {
    parTargetManagementGroupId: 'rios-alz-platform-connectivity'
    parSubscriptionIds:[
      'subidhere'
    ]
  }
}
