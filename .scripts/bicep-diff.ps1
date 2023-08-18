$version = get-date -Format yyyy-MM-dd
$commit = "$ENV:BUILD_SOURCEVERSION"

# get the latest Bicep module files changed
$files = $(git diff HEAD HEAD~ --name-only -- bicep/modules ":(exclude)*/.tests/*" | Where-Object {$_.EndsWith('.bicep')})
if ($files.count -ge 1) {
  # copy files to staging
  copy-item $files -Destination $ENV:BUILD_ARTIFACTSTAGINGDIRECTORY

  # set a variable and build number
  Write-Host ("##vso[task.setvariable variable=bicepFiles]true")
  Write-host ("##vso[build.updatebuildnumber]$($version)")
  Write-Host $files updates found
}

else {
  Write-Host ("##vso[task.setvariable variable=bicepFiles]false")
}
