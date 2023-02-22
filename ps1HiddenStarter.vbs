Set shObj = CreateObject("Wscript.Shell")
Set scName = CreateObject("Scripting.FileSystemObject") ' get the path of the script
Dim path, arg

path = scName.GetParentFolderName(WScript.ScriptFullName) ' extract the basename from the path
file = WScript.Arguments(0) ' to run PowerShell script
scriptPath = scName.BuildPath(path, file)

psParams = "PowerShell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -NonInteractive -File "

shObj.Run(psParams & """" & scriptPath & """" & " """ & path & """"), 0