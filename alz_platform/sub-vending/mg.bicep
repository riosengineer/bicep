targetScope = 'managementGroup'

module sub001 'br/public:lz/sub-vending:1.2.2' = {
  name: 'sub001'
  params: {
    subscriptionAliasEnabled: true
    subscriptionBillingScope: '/providers/Microsoft.Billing/billingAccounts/b971c1a9-e95d-48ae-a185-b80c401a18d8:34206131-6a37-409c-af3d-451618d64493_2018-09-30'
    subscriptionAliasName: 'sub-test-001'
    subscriptionDisplayName: 'sub-test-001'
    subscriptionTags: {
      example: 'true'
    }
    subscriptionWorkload: 'Production'
    subscriptionManagementGroupAssociationEnabled: true
    subscriptionManagementGroupId: 'core'
  }
}
