#Region Call Router Libraries
#-- Define and instantiate Router-Lib variables
#Import-Module Router-Lib

$InitBinaryData = Import-FilePathsToPSObject
Function Export-ArrayNames {
    param (
        [Parameter(Mandatory = $true)]
        [Object[]]$InitBinaryData
    )

    foreach ($Item in $InitBinaryData) {
        # Ensure the item is a PSCustomObject
        if ($Item -is [PSCustomObject]) {
            foreach ($Property in $Item.PSObject.Properties) {
                $PropertyName = $Property.Name
                $PropertyValue = $Property.Value

                # Create the variable in the global scope
                Set-Variable -Name $PropertyName -Value $PropertyValue -Scope Global
            }
        }
    }

    # Return feedback
    return "Variable names created for folder paths"
}
#EndRegion