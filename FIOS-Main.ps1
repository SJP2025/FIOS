#Region FIOS Main
$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"

#--Import/Load Modular framework  into scipt Scope. 
$ImportScriptLibrary = "${DrivePathMain}\Import-Lib.ps1"
. $ImportScriptLibrary
#--Delate and regenerate router (.rtr) files
Reset-Router
$ExecutePathArray = Initiate-Process
Assert-InitialProcess -FilePathArray $ExecutePathArray

#EndRegion
