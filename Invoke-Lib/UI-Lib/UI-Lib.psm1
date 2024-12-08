#Region Define UI's API Functions

#EndRegion
#Source UI-Lib.ps1 
    # $TestOutPutFromUILib = Write-Output "Hello from the UI-Lib.ps1/API"
    # $TestOutPutFromUILibAPI = Write-Output "Helho again from the UI-Lib.ps1/API"
#Define UI-Lib (UI-Lib's API) Function
# Function Get-PathNames {
#     $GetFIOSFolderPaths = Import-FilePathsToPSObject
#     foreach ($item in $GetFIOSFolderPaths) {
#         $item.PSObject.Properties | ForEach-Object {
#             Write-Host "Property Name: $($_.Name)"
#         }
#     }
# }

#export functions and variables to root scope
# Export the functions and variable
# Export-ModuleMember -Variable TestOutPutFromUILib, TestOutPutFromUILibAPI, InitBinaryData 
# Export-ModuleMember -Function Get-PathNames, Import-VariablesToScope
