# publish bicep modules to acr
$version = get-date -Format yyyy-MM-dd

$modules = Get-ChildItem "$env:SYSTEM_ARTIFACTSDIRECTORY" -Include *.bicep -Recurse

foreach ($module in $modules) {
    $name = $module.BaseName
    bicep publish $module.FullName --target "br:crnasuksbicep.azurecr.io/bicep/modules/${name}:${version}"
}
