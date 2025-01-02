#Region FIOS Main
$DrivePathMain = $PSScriptRoot
Write-Output "Sourcing Drive Path: ${DrivePathMain}"

#--Import/Load Modular framework  into scipt Scope. 
$ImportScriptLibrary = "${DrivePathMain}\Import-Lib.ps1"
. $ImportScriptLibrary

#EndRegion
#Region Intro/Test API
#Load TUI style Splash Screen
Invoke-SplashScreen
#Start API/Framework introduction
$textLines = @( 
    "The 'DropAndRun' pattern/framework has been loaded and is running in memory right now.",
    "Let's test the framework by running the interactive API.",
    "Type 'Use-InteractiveAPI' into the PowerShell command line."
)

foreach ($line in $textLines) {
    Write-Host $line -ForegroundColor Blue
}
#EndRegion
