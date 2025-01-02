#Region Define Router's API Functions
#Source Router-Lib.ps1 
$TestOutPutFromRouterLib = Write-Output "Hello from the Router Library API"
$TestOutPutFromRouterLibAPI = Write-Output "Hello again from the Router Library API"
#Define UI-Lib (Router's API) Function
Function Get-PathNames {
$GetFIOSFolderPaths = Import-FilePathsToPSObject
foreach ($item in $GetFIOSFolderPaths) {
    $item.PSObject.Properties | ForEach-Object {
        Write-Host "Folder Path Variable Name: `$$($_.Name)"
    }
}
$blockText = @"
Enter one of the above Folder Path Variable Names to call/reference
the absolute path contained in the variable. These folder path variables
are generated and populated dynamically as you add folders to the "DropAndRun" framework.
Once you have completed this step, type 'Use-RouterAPI' to learn more about how this functionality works.
"@

Write-Host $blockText -ForegroundColor Blue
}

#export functions and variables to root scope
# Export the functions and variable
Export-ModuleMember -Variable TestOutPutFromUILib, TestOutPutFromUILibAPI, InitBinaryData 
Export-ModuleMember -Function Get-PathNames, Import-VariablesToScope

#EndRegion


