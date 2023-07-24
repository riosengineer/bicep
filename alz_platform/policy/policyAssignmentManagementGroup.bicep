targetScope = 'managementGroup'

metadata name = 'ALZ Bicep - Management Group Policy Assignments'
metadata description = 'Module used to assign policy definitions to management groups'

module policyAssignment1 '../modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: 'policyAssignment-Microsoft-Cloud-Security-Benchmark'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8'
    parPolicyAssignmentDescription: 'The Microsoft cloud security benchmark initiative represents the policies and controls implementing security recommendations defined in Microsoft cloud security benchmark, see https://aka.ms/azsecbm. This also serves as the Microsoft Defender for Cloud default policy initiative. You can directly assign this initiative, or manage its policies and compliance results within Microsoft Defender for Cloud.'
    parPolicyAssignmentDisplayName: 'Microsoft cloud security benchmark'
    parPolicyAssignmentName: 'Cloud-Security-Benchmark'
  }
}
