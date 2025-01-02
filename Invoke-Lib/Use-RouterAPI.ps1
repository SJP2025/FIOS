#Region Router API
function Use-RouterAPI {
    Param (
        [String]$blockText,
        [String]$RouterAPI_P1
    )

    # Define blockText if not provided
    if (-not $blockText) {
        # Break the text into sections
        $Section1 = @"
If you browse the 'DropAndRun' Framework you will notice that, within every folder 
is a script file named "Get-RelativePath.ps1". This file is required for your new folder to 
be added to the 'DropAndRun Router'. In other words, to have your new folder's absolute path 
dynamically saved to a variable for relative path-like folder mapping functionality, you just 
need to copy one of the many copies of this "Get-RelativePath.ps1" script file into your new folder.
"@

        $Section2 = @"
Once you have created your new folder, added the "Get-RelativePath.ps1" file to it, and restarted the framework,
the absolute path to your new folder will be assigned to a variable with the same name as your folder. Be aware 
that your folders will also become variable names as you build out the folder structure for your new PowerShell application.
Once you have completed the above steps, you will see your "Folder Path Variable Name:" whenever you use the "Get-Pathnames" function.
"@

        $Section3 = @"
Note-1: Any changes you make to the folder structure of your application will also be applied dynamically
each time you restart the framework.

Note-2: If you are an experienced PowerShell developer, you might have noticed that a great deal of the
modular functionality that this framework implements is coded/located within the "Import-Lib.ps1" file. 
This is by design. The purpose of the "Import-Lib.ps1" functionality is to allow developers to decouple 
modifications/development of the framework itself from the development of applications/scripts (or modules) 
designed for execution within the framework.
"@

        $Section4 = @"
Example 1: If you have made modifications to the DropAndRun framework itself, you can test just the framework by
running the "Import-Lib.ps1" file.

Example 2: If you want to isolate/test a new modular component of your application without executing any other modules,
you can test your new modules by calling them from the "Import-Lib.ps1" file. 

In other words, I'm playing with the idea of adding TDD functionality to the framework at some point. The "Import-Lib.ps1" 
is currently acting as my placeholder for that part/phase of the development process on this project/framework.

Type 'Invoke-InteractiveAPI' to see an index of calls to this "DragAndDrop" framework's interactive API.
"@
    }

    # Assign blockText to RouterAPI_P1
    $RouterAPI_P1 = $blockText 

    # Display each section interactively
    Clear-Host
    Write-Host $Section1 -ForegroundColor Blue
    Read-Host -Prompt "Press Enter to continue"

    Clear-Host
    Write-Host $Section2 -ForegroundColor Blue
    Read-Host -Prompt "Press Enter to continue"

    Clear-Host
    Write-Host $Section3 -ForegroundColor Blue
    Read-Host -Prompt "Press Enter to continue"

    Clear-Host
    Write-Host $Section4 -ForegroundColor Blue
}

#EndRegion