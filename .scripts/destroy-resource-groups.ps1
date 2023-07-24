# Resource Group destroy reources but keep the RG in place

# Empty ARM template schema
$destoryARMTemplate = @{
    '$schema' = 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
    contentVersion = '1.0.0.0'
    resources = @()
}

# Collect resource group list to variable
$rgDestroyList = Get-AzResourceGroup | Select-Object ResourceGroupName

# Deployment name
$stamp = Get-Date -UFormat %T%D

# For each resource group loop ARM template deployment 
foreach($rg in $rgDestroyList)
{
    New-AzResourceGroupDeployment -Name "$rg-$stamp" `
        -ResourceGroupName $rg `
        -TemplateObject $destroyARMTemplate `
        -Mode Complete -AsJob -Force
}
