#Clean and generate/regenerate absolute Path files (.rtr files)
#Region Generate router files
$DrivePathLib = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathLib}"
#EndRegion
#Generate Drive path ".rtr" files (Absolute path reference files)
#Region Generate Absolute PAth Reference
Function Initiate-Process {
    param (
        [String]$GetRelativePathScript = "Get-RelativePath.ps1",
        [String]$FileSearchPath = $DrivePathMain
    )

    # Perform a recursive search for the target file
    $RouterCalls = Get-ChildItem -Path $FileSearchPath -Recurse -File | Where-Object {
        $_.Name -eq $GetRelativePathScript
    } | ForEach-Object {
        [PSCustomObject]@{
            FileName = $_.Name
            FilePath = $_.FullName
        }
    }

    # Return the structured object array
    return $RouterCalls
}

