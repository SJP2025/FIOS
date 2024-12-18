#Region Define Router's API Functions
#Source Router-Lib.ps1 
$TestOutPutFromRouterLib = Write-Output "Hello from the Router-Lib.ps1/API"
$TestOutPutFromRouterLibAPI = Write-Output "Helho again from the Router-Lib.ps1/API"
#Define UI-Lib (Router's API) Function
Function Get-PathNames {
$GetFIOSFolderPaths = Import-FilePathsToPSObject
foreach ($item in $GetFIOSFolderPaths) {
    $item.PSObject.Properties | ForEach-Object {
        Write-Host "Folder Path Variable Name: $($_.Name)"
    }
}
}

#export functions and variables to root scope
# Export the functions and variable
Export-ModuleMember -Variable TestOutPutFromUILib, TestOutPutFromUILibAPI, InitBinaryData 
Export-ModuleMember -Function Get-PathNames, Import-VariablesToScope

#EndRegion


