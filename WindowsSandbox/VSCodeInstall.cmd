REM this script should be located on the Windows Host in directory C:\SandboxScripts

REM Download VSCode
curl -L "https://update.code.visualstudio.com/latest/win32-x64-user/stable" --output C:\users\WDAGUtilityAccount\Desktop\vscode.exe
 
REM Install and run VSCode (latest stable version)
C:\users\WDAGUtilityAccount\Desktop\vscode.exe /verysilent /suppressmsgboxes