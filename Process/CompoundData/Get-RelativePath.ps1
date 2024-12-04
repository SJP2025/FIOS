function Get-RelativePath {
    # Ensure the function gets the script's directory
    param (
        [string]$path = $PSScriptRoot
    )

    # Get the current folder name
    $CurrentFolder = Split-Path -Path $path -Leaf

    # Construct the full file path
    $filePath = "C:\Users\compu\Desktop\FIOS\Process\Router\$CurrentFolder`FolderPath.rtr"

    # Ensure the folder exists before writing to the file
    $folderPath = Split-Path -Path $filePath
    if (-not (Test-Path -Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
    }

    # Write the path to the file
    $path | Out-File -FilePath $filePath -Force

    # Return the constructed file path for reference
    return $filePath
}

# Example usage
#$generatedFilePath = Get-RelativePath
#Write-Output "Path written to: $generatedFilePath"