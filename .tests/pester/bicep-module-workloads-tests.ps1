BeforeDiscovery {
    # Change the current directory to the Bicep module folder
    Set-Location -Path "alz\alz_workloads\modules"
    # Define the module and test paths
    $testPath = "/home/vsts/work/1/s/alz/alz_workloads/modules/.tests"
    $moduleFiles = Get-ChildItem -Filter *.bicep
    $testFiles = foreach ($moduleFile in $moduleFiles) {
        Join-Path $testPath ($moduleFile.BaseName + '.tests.bicep')
    }
}

Describe "test file" -ForEach $testFiles {
    # Check if a corresponding .tests.bicep file exists for each .bicep module file
    It "$_ should exist" {
        $_ | Should -Exist
    }
}