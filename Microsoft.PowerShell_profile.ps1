Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView

Invoke-Expression (&starship init powershell)

function Invoke-Starship-PreCommand
{
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  $prompt = "$([char]27)]9;12$([char]7)"
  if ($loc.Provider.Name -eq "FileSystem")
  {
    $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $host.ui.Write($prompt)
}

# Define la función Th para cambiar de directorio
# function Th
# {
#   Set-Location -Path "C:\Users\lenny\Documents\Lennyn\PROYECTOS\Th_Sistema"
# }
#
# function Cf
# {
#   Set-Location -Path "C:\Users\lenny\AppData\Local\nvim"
# }
#
# function Prs
# {
#   Set-Location -Path "C:\Users\lenny\Documents\Lennyn\PRACTICAS"
# }
#
# function Epn
# {
#   Set-Location -Path "C:\Users\lenny\Documents\Lennyn\EPN"
# }
#
# function pw
# {
#   Set-Location -Path "C:\Users\lenny\Documents\PowerShell"
# }


# Función para fzfbat
function fzfbat
{
  fzf --preview="bat --theme=gruvbox-dark --color=always {}"
}

# Función para fzfnvim
function fzfnvim
{
  nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")
}

function ex
{
  explorer .
}

$env:LC_ALL="en_US.UTF-8"
$env:LANG="en_US.UTF-8"


Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

fnm env | Out-String | Invoke-Expression

if (Test-Path "C:\Users\lenny\.jabba\jabba.ps1")
{ . "C:\Users\lenny\.jabba\jabba.ps1"
}
