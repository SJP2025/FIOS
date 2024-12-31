#Region FIOS Main
$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"

#--Import/Load Modular framework  into scipt Scope. 
$ImportScriptLibrary = "${DrivePathMain}\Import-Lib.ps1"
. $ImportScriptLibrary
#--Delete and regenerate router (.rtr) files
Reset-Router
$ExecutePathArray = Initiate-Process
Assert-InitialProcess -FilePathArray $ExecutePathArray

#EndRegion
Write-Host "The drop and run pattern/framework has been loaded and is running in memory right now"
Write-Host "Lets test the framework by running the interactive API"
Write-Host "Type 'Use-InteractiveAPI' into the powershell command line"