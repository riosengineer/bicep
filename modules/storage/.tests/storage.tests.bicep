// Test with only required parameters - Nasstar Tech Day Demo with Privaten Bicep ACR
module test_required_params '../storage.bicep' = {
  name: 'test_required_params'
  params: {
    location: 'uksouth'
    tags: {
      Demo: 'Tech Day'
    }
    storageName: 'sttechdaydemo1111'
    storageSkuName: 'Standard_GRS'
    storagePleBlobName: 'techdaywhatever'
    storagePleFileName: 'techdayfilesjare'
    subnetId: 'test'
    virtualNetworkId: 'test'
  }
}
