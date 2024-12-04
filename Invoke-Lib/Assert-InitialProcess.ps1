Function Assert-InitialProcess {
    param (
        [PSCustomObject]$FilePathArray
    )

    # Iterate through each item in the array
    foreach ($file in $FilePathArray) {
        # Dot source the script file
        if (Test-Path $file.FilePath) {
            . $file.FilePath
        } else {
            Write-Error "File not found: $($file.FilePath)"
            continue
        }

        # Strip the extension from the file name
        $nameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($file.FileName)

        # Attempt to invoke the function/script
        if (Get-Command $nameWithoutExtension -ErrorAction SilentlyContinue) {
            & $nameWithoutExtension
        } else {
            Write-Warning "Command or function '$nameWithoutExtension' not found."
        }
    }
}
