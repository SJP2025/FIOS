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
