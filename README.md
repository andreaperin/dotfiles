# dotfiles
Steps to follow for step a brand new os

## 1) Windows
### 1.1) Prerequisites
- Git Installed
- Fira Code Mono NF installed and working (https://eng.m.fontke.com/font/61026051/download/)
- Download a Nerd Font with Powerline Symbols (e.g FiraCode NF, Caskdadia Mono NF)
- Download Scoop
- Download PowerShell 7 or greater
- Download WindowsTerminal
- Download Git
- install modules posh-git and oh-my-posh 
  ```Install-Module posh-git -Scope CurrentUser```
  ```Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease```
- edit $PROFILE
  ```oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\ato
      if ($host.Name -eq 'ConsoleHost') {
          Import-Module PSReadLine
          Import-Module -Name Terminal-Icons
          Import-Module -Name PoShKeePass
      }

      Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete```
      
- Add aliases

- Delete Font Cache
- Set NF-font as windows terminal default font
- Install VScode
- Change terminal.external.font in settings

## 1.1) TODO
- add check for powershell 7 and vscode download
- fira code nf download https://eng.m.fontke.com/font/61026051/download/
- win cache cleanup https://thegeekpage.com/how-to-delete-the-font-cache-on-windows-10/