targetScope = 'managementGroup'

// ----------
// PARAMETERS
// ----------
var assigneeObjectId = '00000000-0000-0000-0000-000000000000' // AAD Principal ID
var readerRoleDefinitionId = 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
var contributorRoleDefinitionId = 'b24988ac-6180-42a0-ab88-20f7382dd24c'
var ownerRoleDefinitionId = '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'

var alz_owners = 'guidhereofaadsecgroup'
// ---------
// RESOURCES
// ---------

@description('Management Group RBAC assignment.')
module baseline_ra '../modules/roleAssignmentManagementGroup.bicep' = {
  name: 'mgmt_rbac'
  scope: managementGroup('rios-alz')
  params: {
    parRoleDefinitionId: ownerRoleDefinitionId
    parAssigneePrincipalType: 'Group'
    parAssigneeObjectId: alz_owners
    parTelemetryOptOut: true
    parRoleAssignmentNameGuid: guid(managementGroup().name, ownerRoleDefinitionId, alz_owners)
  }
}
