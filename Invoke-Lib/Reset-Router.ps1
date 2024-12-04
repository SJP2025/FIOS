#Region Clear Relative path file (.rtr)
Function Reset-Router {
    $FolderPath = "$DrivePathMain\Process\Router"

    # Search for all .rtr files and delete them
    Get-ChildItem -Path $FolderPath -Recurse -File -Filter "*.rtr" | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Write-Output "Deleted file: $($_.FullName)"
    }
 }
 #EndRegion