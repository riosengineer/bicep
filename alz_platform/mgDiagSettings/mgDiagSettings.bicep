targetScope = 'managementGroup'

metadata name = 'ALZ Bicep - Management Group Diagnostic Settings'
metadata description = 'Module used to set up Diagnostic Settings for Management Groups'

param logAnyalticsWorkspaceResourceID string = ''
param mangagemnetGroupIDs array = ['rios-alz-decomissioned', 'rios-alz-landingzones-core','rios-alz-landingzones', 'rios-alz-platform-connectivity', 'rios-alz-platform', 'rios-alz-sandbox', 'rios-alz']

module mgDiagSettings '../modules/mgDiagSettings.bicep' = [for mg in mangagemnetGroupIDs: {
  name: 'mgDiagSetting-${mg}'
  scope: managementGroup(mg)
  params: {
    parLogAnalyticsWorkspaceResourceId: logAnyalticsWorkspaceResourceID
  }
}]
