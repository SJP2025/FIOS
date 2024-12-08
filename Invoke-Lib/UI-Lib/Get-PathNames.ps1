#Region Interactive API Test 
Function Get-PathNames {
    $GetFIOSFolderPaths = Import-FilePathsToPSObject
    foreach ($item in $GetFIOSFolderPaths) {
        $item.PSObject.Properties | ForEach-Object {
            Write-Host "Property Name: $($_.Name)"
        }
    }
}
#EndRegion