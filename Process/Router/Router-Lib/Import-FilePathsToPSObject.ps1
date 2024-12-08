$GetPAthToApplicationRoot = Get-FIOSROOT
$DrivePathMain = $GetPAthToApplicationRoot.path

#Region Call Router Paths
Function Import-FilePathsToPSObject {
    param (
        [string]$DrivePathMain = "C:\Users\compu\Desktop\FIOS"  # Default value
    )

    if (-not $DrivePathMain) {
        Write-Error "The 'DrivePathMain' variable is not set. Please specify a valid base path."
        return
    }

    $folderPath = Join-Path -Path $DrivePathMain -ChildPath "Process\Router\Router-Lib\Router-Paths"
    $fileExtension = ".rtr"

    $fileContentsArray = @()

    if (Test-Path -Path $folderPath) {
        $files = Get-ChildItem -Path $folderPath -Filter "*$fileExtension"

        foreach ($file in $files) {
            $originalName = $file.BaseName
            [Int]$FileNameCharsArray = $originalName.Length
            $fileNameWithoutExtension = $originalName.Substring(0, $FileNameCharsArray - 10) -replace "-", ""

            $fileContent = Get-Content -Path $file.FullName -Raw

            $customObject = [PSCustomObject]@{
                $($fileNameWithoutExtension) = $fileContent
            }

            $fileContentsArray += $customObject
        }

        return $fileContentsArray
    } else {
        Write-Warning "The specified folder does not exist: $folderPath"
        return $null
    }
}
#End Region
<#
In practice the the router calls/defines a folder path by it's array property name. 
The Array property is dynamincally generated via a regex modified version of the .rtr file's name.

for Example:
The folder path contained in the follow file..
    \FIOS\Process\Router\Router-Lib\Router-Paths\StringDataFolderPath.rtr
        Would be call by its property name..
        Property Name: StringData 
    Note-1: The "FolderPath" sub-string has been subtracted has been subtracted from the .rtr file name. 
    Note-2: The "-" would be or/has been subtracted has been subtracted from the .rtr file name.
    Note-2: The of course the ".rtr" extension it self has been subtracted from the .rtr file name.

    So one would call/route to the above folder path using a hashtable type syntax..

        PS C:\Users\compu\Desktop\FIOS> $testfunction = Import-FilePathsToPSObject
        PS C:\Users\compu\Desktop\FIOS> $testfunction.StringData
        C:\Users\compu\Desktop\FIOS\Process\StringData

Here is another example: 
Where "-" is parsed to dynamically generate the Array property name.. 
    \FIOS\Process\Router\Router-Lib\Router-Paths\Router-PathsFolderPath.rtr

        PS C:\Users\compu\Desktop\FIOS> $testfunction.RouterPaths
        C:\Users\compu\Desktop\FIOS\Process\Router\Router-Lib\Router-Paths

Note-4:
There will be an interactive API functions for looking up all the dynymically 
generated folder and Array property names in the neer future. As well as many other interactive API 
helper type Function as this application/framework continues to develop.  
#>



