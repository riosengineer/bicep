//
// Baseline deployment sample
//

// Use this sample to deploy the minimum resource configuration.

targetScope = 'resourceGroup'

@description('The Azure location to deploy to.')
param location string = resourceGroup().location

// ----------
// PARAMETERS
// ----------

// ---------
// RESOURCES
// ---------

@description('Baseline resource configuration')
module baseline_logging '../modules/logging.bicep' = {
  name: 'baseline_logging'
  params: {
    parLogAnalyticsWorkspaceLocation: location
    parAutomationAccountLocation: location
    parLogAnalyticsWorkspaceName: 'alz-log-analytics'
    parLogAnalyticsWorkspaceSkuName: 'PerGB2018'
    parLogAnalyticsWorkspaceSolutions: [
      'AgentHealthAssessment'
      'AntiMalware'
      'ChangeTracking'
      'Security'
      'SecurityInsights'
      'SQLAdvancedThreatProtection'
      'SQLVulnerabilityAssessment'
      'SQLAssessment'
      'Updates'
      'VMInsights'
    ]
    parAutomationAccountName: 'alz-rios-automation-account-prod'
    parAutomationAccountUseManagedIdentity: true
    parTelemetryOptOut: false
  }
}
