#
$CurrentLocation = $PSScriptRoot
$hello = Write-Output "hello world"
$hello

& "${CurrentLocation}\Invoke-Lib\Get-RelativePath.ps1"
Get-RelativePath
