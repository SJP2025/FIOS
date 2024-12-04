$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"

#--
# $CallInitialProcess = "C:\Users\compu\Desktop\FIOS\Invoke-Lib\Initiate-Process.ps1"
# . $CallInitialProcess
$ImportScriptLibrary = "${DrivePathMain}\Import-Lib.ps1"
. $ImportScriptLibrary
#--Delate and regenerate router (.rtr) files
Reset-Router
$ExecutePathArray = Initiate-Process
Assert-InitialProcess -FilePathArray $ExecutePathArray
