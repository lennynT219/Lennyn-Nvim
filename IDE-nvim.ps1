# Variables
$currentUser = (Get-CimInstance Win32_ComputerSystem).UserName.Split('\')[-1]
$profilePath = "C:\Users\$currentUser\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# Crear el archivo de configuracion de PowerShell
if (!(Test-Path -Path $profilePath))
{
  New-Item -ItemType File -Path $profilePath -Force
}

# Iconos de terminal
Install-Module -Name Terminal-Icons -Repository PSGallery
Set-Content -Path $profilePath -Value 'Import-Module Terminal-Icons'

# Configuracion de autocompletado
Add-Content -Path $profilePath -Value 'Set-PSReadLineOption -PredictionViewStyle ListView'

# Funciones personalizadas
Add-Content -Path $profilePath -Value 'function ex { explorer .}'

# Intalar chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Instalar zoxide
choco install zoxide -y
Add-Content -Path $profilePath -Value 'Invoke-Expression (& { (zoxide init powershell | Out-String) })'

# Instalar starship
choco install starship -y
Add-Content -Path $profilePath -Value 'Invoke-Expression (&starship init powershell)'

# Instalar la fuente - Iosevka Term
choco install nerd-fonts-iosevkaterm -y

# Instalar Git
choco install git -y

# Instalar Lazygit
choco install lazygit -y

# Instalar compilador de C/C++
choco install mingw -y

# Instalar fnm
choco install fnm -y
Add-Content -Path $profilePath -Value 'fnm env | Out-String | Invoke-Expression'

# Instalar bun
choco install bun -y

# Instalar busqueda de archivos
choco install fd -y

# Instalar busqueda de texto
choco install ripgrep -y

# Instalar Nvim
choco install neovim -y

# Configurar Nvim
git clone https://github.com/lennynT219/Lennyn-Nvim.git $env:LOCALAPPDATA\nvim
# Remove-Item -Path $env:LOCALAPPDATA\nvim\.git -Recurse -Force
Remove-Item -Path $env:LOCALAPPDATA\nvim\IDE-nvim.ps1 -Recurse -Force
