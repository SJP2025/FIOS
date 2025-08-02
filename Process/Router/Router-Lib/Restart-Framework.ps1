#Restart the the dropAndRun Frame 
<#
Generaly restarting the famework is something that one might do after 
a folder to the one framework's libraries. For example.. If i were to create named 
"MathTutor" add that folder to the frameworks main library folder "Invoke-Lib"

I would call the this restart function to auto-create variable that would  
contain the full path to new "MathTutor" folder name "$MathTutor"
 
#>
function Restart-Framework {
    $scriptPath = "C:\Users\compu\OneDrive\Desktop\VM-share\MyNewTeacher\MyNewTeacher.ps1"
    $rootPath = Split-Path $scriptPath

    Write-Host "Restarting FIOS framework in current session..."

    & $scriptPath -DrivePathMain $rootPath
    Clear-Host
return Invoke-SplashScreen
}