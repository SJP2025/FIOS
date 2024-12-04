#--Set DrivePath Variable
#Region Set DrivePath Variable
$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"
#EndRegion

#Region Add \Lib\ PSModules Path
$InvokeLibFolder = "${DrivePathMain}\Invoke-Lib"
$LibPath = "${DrivePathMain}\Invoke-Lib"
# Add the folder to the $PSModulePath if not already added
if ($env:PSModulePath -notlike "*$InvokeLibFolder*") {
    try {
        $env:PSModulePath += ";$InvokeLibFolder"
        Write-Output "Invoke-Lib folder added to PSModulePath."
    } catch {
        Write-Host "Failed to add Invoke-Lib folder to PSModulePath: $_"
        exit 1
    }
} else {
    Write-Output "Invoke-Lib folder is already in PSModulePath."
}
#EndRegion

#Region Import Script mudules
# Retrieve and source .psm1 files
$PluginsPsm1Files = Get-ChildItem -Path $LibPath -Filter "*.psm1"
ForEach ($File in $PluginsPsm1Files) {
    $PluginsModulePath = Join-Path $LibPath $File.Name
    Write-Output "Sourcing module: $PluginsModulePath"
    if ($File.Name -ne "Invoke-Lib.psm1") {
        . $PluginsModulePath
    }
}
# Retrieve and source all the function script as ".ps1" files from the Add-Plugins folder 
${PluginsPs1Files} = Get-ChildItem -Path $LibPath -Filter "*.ps1"
ForEach (${InstallPluginsFile} in ${PluginsPs1Files}) {
    ${InstallPluginsScriptPath} = Join-Path $LibPath ${InstallPluginsFile}.Name
    Write-Output "Sourcing script: ${InstallPluginsScriptPath}"
    if (${InstallPluginsFile}.Name -ne "Invoke-Lib.ps1") {
        . ${InstallPluginsScriptPath}
    }
}
#EndRegion
