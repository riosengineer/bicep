using 'managementGroups.bicep'

param parLandingZoneMgAlzDefaultsEnable = false
param parLandingZoneMgChildren = {
      core:{
        displayName: 'Core'
      }
    }
param parLandingZoneMgConfidentialEnable = false
param parPlatformMgAlzDefaultsEnable = false
param parPlatformMgChildren = {
  connectivity:{
          displayName: 'Connectivity'
    }
}
param parTopLevelManagementGroupDisplayName = 'Rios - ALZ'
param parTopLevelManagementGroupPrefix = 'rios-alz'
