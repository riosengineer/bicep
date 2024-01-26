# create a new container that will be executed
$container = New-PesterContainer -Path './pipelines/.tests/pester/bicep-module-tests.ps1'

$config = New-PesterConfiguration
$config.TestResult.OutputFormat = "NUnitXML"
$config.TestResult.OutputPath = "test-Pester.xml"
$config.TestResult.Enabled = $True
$config.Run.Container = $container

Invoke-Pester -Configuration $config