<#
Install Chocolatey
https://chocolatey.org/
#>

Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

<#
Install Fira Code
https://github.com/tonsky/FiraCode
#>

choco install firacode

<#
Add "allow" rule to Windows firewall for WSL2 network
https://www.jetbrains.com/help/pycharm/using-wsl-as-a-remote-interpreter.html
https://github.com/microsoft/WSL/issues/4585
#>
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
