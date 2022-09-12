# BashBunny-WinPersist
Windows persistence injection using custom reflective DLL injection malware.

Kirt Cathey nor SysRisk take any responsibility for what may become of these files. Use at your own peril and know what you are doing before implementing.
Payload.txt is the BashBunny script that call foxme.ps1 and stores the persistence files. FireService.vbs is the persistence file that is loaded into the Startup folder to gain persistence.

Look for square brackets [] and input your filename, destination IP, and destination port there. You can also use netcat and the scripts are commented out in these files, since netcat is generally detected by AV these days.
