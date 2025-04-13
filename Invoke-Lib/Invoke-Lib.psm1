#Region Main Script modules
# #-Source Core module .ps1 file (Ref: TUI/Menu system)
# $EnableUtils = Join-Path -Path $PSScriptRoot -ChildPath "\Enable-Utils\Enable-Utils.ps1"
# . $EnableUtils
#region Map the Enable-Utils/PSModulePath
Function Invoke-RelativePath {
    # Get the root path of the module using $PSScriptRoot
    $ScriptRoot = $PSScriptRoot
    # Return the relative path of the current script/module folder
    return $ScriptRoot
}

Function Invoke-RootPath {
    # Call Invoke-RelativePath to get the module's root directory
    $CurrentFolder = Invoke-RelativePath
    # Navigate to the parent directory explicitly using Split-Path
    $ParentFolder = Split-Path -Path $CurrentFolder -Parent
    # Return the absolute path to the parent directory
    return $ParentFolder
}

function Invoke-Hostname {
    $CurrentHostObject = $env:COMPUTERNAME
    $CurrentHost = [string]$CurrentHostObject
    return $CurrentHost
}

#endregion
Export-ModuleMember -Function Invoke-RelativePath, Invoke-RootPath, Invoke-Hostname
#Export-ModuleMember -Variable Name $CurrentHost
#EndRegion