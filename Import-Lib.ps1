#--Set DrivePath Variable
#Region Set DrivePath Variable
#-- The DrivePath variable functions in sort of dual role.
#-- First it defines the Root folder of the FIOS Application/package
#-- Second it used via the Get-RelativePath Function/File to
#-- dymaminally generate absolute paths for use by the Router Module.
#-- The Router module is the core of this FIOS application framework.
#-- The design of this framework is based on the concept of a dynamic
#-- Powershell script mapping and scoping functionality.
#--------------------------------------------------------------------
#-- The Concept:
#-- A modular Powershell scripting framework. The Framework dynacally 
#-- loads Powershell scripts modules based on file location.
#-- And dynamincally brings modules into the current script scope by
#-- adding/removing module folders to and from the $PSScriptRoot path for 
#-- duration of the FIOS-Main.ps1 script/process.
#-- Thus, The framework is soft of designed to effect a "drop & run"
#-- type of functionality.
#-- Securing execution of the framework might be effected in different ways
#-- depending on the version of the script. The plan is to make two versions available..
#-- One.. The portable version. This version will be secured by compiling the code/framework
#-- to a .exe file and storing data using hashed/encrypted files as a secure abstraction layer. 
#-- Two.. The installed version. Will be secured via a local DB account and managed via RDBMS 
#-- based authentication process, that will pass PS executionPolicy via hashed
#-- credentials that will be stored/managed by a user specific RDBMS account. functioning something
#-- not unlike a Password manager. (Thats the plan at the design stage anyway, Lets see how things
#-- unfold in translation from design/concept to prototype) 
$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"
#EndRegion

#Region Add \Lib\ PSModulesPath
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

#Region Import Invoke-Lib modules
# Retrieve and source .psm1 files
$LibPsm1Files = Get-ChildItem -Path $LibPath -Filter "*.psm1"
ForEach ($LibFile in $LibPsm1Files) {
    $LibScriptPath = Join-Path $LibPath $LibFile.Name
    Write-Output "Sourcing module: $LibScriptPath"
    if ($LibFile.Name -ne "Invoke-Lib.psm1") {
        . $LibScriptPath
    }
}
# Retrieve and source all the function script as ".ps1" files from the Invoke-Lib folder 
$LibPs1Files = Get-ChildItem -Path $LibPath -Filter "*.ps1"
ForEach ($InstallLibFile in $LibPs1Files) {
    $InstallLibScriptPath = Join-Path $LibPath $InstallLibFile.Name
    Write-Output "Sourcing script: $InstallLibScriptPath"
    if ($InstallLibFile.Name -ne "Invoke-Lib.ps1") {
        . $InstallLibScriptPath
    }
}
#EndRegion
#------------------------
#Region Add \Router-Lib\ PSModulesPath
#--Map module to the $PSModulePath variable--
$RouterLibFolder = "${DrivePathMain}\Process\Router\Router-Lib"
$RouterLibPath = "${DrivePathMain}\Process\Router\Router-Lib"
# Add the folder to the $PSModulePath if not already added
if ($env:PSModulePath -notlike "*$RouterLibFolder*") {
    try {
        $env:PSModulePath += ";$RouterLibFolder"
        Write-Output "Router-Lib folder added to PSModulePath."
    } catch {
        Write-Host "Failed to add Router-Lib folder to PSModulePath: $_"
        exit 1
    }
} else {
    Write-Output "Router-Lib folder is already in PSModulePath."
}
#EndRegion

#Region Import Router-Lib modules
# Retrieve and source .psm1 files
$RouterLibPsm1Files = Get-ChildItem -Path $RouterLibPath -Filter "*.psm1"
ForEach ($PSM1File in $RouterLibPath) {
    $RouterLibScriptPath = Join-Path $RouterLibPath $RouterLibPsm1Files.Name
    Write-Output "Sourcing Module: $PluginsModulePath"
    if ($RouterLibPsm1Files.Name -ne "Router-Lib.psm1") {
        . $RouterLibScriptPath
    }
}

# Retrieve and source all the function script as ".ps1" files from the Router-Lib folder 
$RouterLibPs1Files = Get-ChildItem -Path $RouterLibPath -Filter "*.ps1"
ForEach ($InstallRouterLibFile in $RouterLibPs1Files) {
    $InstallRouterLibScriptPath = Join-Path $RouterLibPath $InstallRouterLibFile.Name
    Write-Output "Sourcing script: $InstallRouterLibScriptPath"
    if ($InstallRouterLibFile.Name -ne "Router-Lib.ps1") {
        . $InstallRouterLibScriptPath
    }
}
#EndRegion
#------------------------
#Region Import UI-Lib modules
$UiLibFolder = "${DrivePathMain}\Invoke-Lib\UI-Lib"
$UiLibPath = "${DrivePathMain}\Invoke-Lib\UI-Lib"
# Add the folder to the $PSModulePath if not already added
if ($env:PSModulePath -notlike "*$UiLibFolder*") {
    try {
        $env:PSModulePath += ";$UiLibFolder"
        Write-Output "UI-Lib folder added to PSModulePath."
    } catch {
        Write-Host "Failed to add UI-Lib folder to PSModulePath: $_"
        exit 1
    }
} else {
    Write-Output "UI-Lib folder is already in PSModulePath."
}

#EndRegion

#Region Add \UI-Lib\ PSModulesPath
# Retrieve and source .psm1 files
$UiLibPsm1Files = Get-ChildItem -Path $UiLibPath -Filter "*.psm1"
ForEach ($UiLibFile in $UiLibPsm1Files) {
    $UiLibScriptPath = Join-Path $UiLibPath $UiLibFile.Name
    Write-Output "Sourcing module: $UiLibScriptPath"
    if ($UiLibFile.Name -ne "UI-Lib.psm1") {
        . $UiLibScriptPath
    }
}

# Retrieve and source all the function script as ".ps1" files from the Add-Plugins folder 
$UiLibPs1Files = Get-ChildItem -Path $UiLibPath -Filter "*.ps1"
ForEach ($InstallUiLibFile in $UiLibPs1Files) {
    $InstallUiLibScriptPath = Join-Path $UiLibPath $InstallUiLibFile.Name
    Write-Output "Sourcing script: $InstallUiLibScriptPath"
    if ($InstallUiLibFile.Name -ne "UI-Lib.ps1") {
        . $InstallUiLibScriptPath
    }
}
#EndRegion
#Region Interactive API
# Source Module files for UI-Lib (Home of interactive API functions for the UI library)
$UILibAPI = "${DrivePathMain}\Invoke-Lib\UI-Lib\UI-Lib.psm1"
Import-Module $UILibAPI
$SourceUILibPs1File = "${DrivePathMain}\Invoke-Lib\UI-Lib\UI-Lib.ps1"
. $SourceUILibPs1File
#Import User Interface library Modules
#Import-Module UI-Lib
# Source Module files for UI-Lib (Home of interactive API functions for the Router library)
$RouterLibAPI = "${DrivePathMain}\Process\Router\Router-Lib\Router-Lib.psm1"
Import-Module $RouterLibAPI
$SourceRouterLibPs1File = "${DrivePathMain}\Process\Router\Router-Lib\Router-Lib.ps1"
. $SourceRouterLibPs1File
#import Router library Modules
#Import-Module Router-Lib
# Source Module files for Invoke-Lib (Home of interactive API functions for the Main Library library)
$InvokeLibAPI = "${DrivePathMain}\Invoke-Lib\Invoke-Lib.psm1"
Import-Module $InvokeLibAPI
$SourceInvokeLibPs1File = "${DrivePathMain}\Invoke-Lib\Invoke-Lib.ps1"
. $SourceInvokeLibPs1File
#import Main library Modules
#Import-Module Invoke-Lib
#Initiate Folder path variable names (Ref: Router API)
Export-ArrayNames -InitBinaryData $InitBinaryData