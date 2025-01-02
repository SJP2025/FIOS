function Invoke-SplashScreen {
    $SplashScreen = @(
        @{ Text = "**************************************"; Color = "Cyan" }
        @{ Text = "***************The********************"; Color = "Blue" }
        @{ Text = "************DropAndRun****************"; Color = "Blue" }
        @{ Text = "*******Framework/Design Pattern*******"; Color = "Blue" }
        @{ Text = "*****Created By Computer R.N.D LLC*****"; Color = "Cyan" }
        @{ Text = "***************************************"; Color = "Cyan" }
    )

    Clear-Host

    # Display each line with a small delay
    foreach ($line in $SplashScreen) {
        Write-Host $line.Text -ForegroundColor $line.Color
        Start-Sleep -Milliseconds 200
    }
}
