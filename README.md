# 🛠️ Lennyn-Nvim

Configuración personalizada de Neovim para maximizar tu productividad con estilo.
Este script automatiza la instalación y configuración desde cero, ideal para
nuevos entornos.

---

## 🚀 Requisitos

1. **Tener acceso a PowerShell 7 o superior**
2. **Ejecutar PowerShell como administrador** en los pasos indicados

---

## 📥 1. Instalar la última versión de PowerShell

Abre PowerShell (puede ser el clásico) y ejecuta:

```powershell
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
```

Esto descargará e instalará PowerShell 7 usando un instalador MSI.

---

## 🔐 2. Habilitar la ejecución de scripts de terceros

En la nueva PowerShell 7 (ya instalada), ejecuta:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Esto te permitirá ejecutar scripts descargados de internet bajo ciertas
condiciones seguras.

---

## ⚙️ 3. Ejecutar el instalador de configuración de Neovim

Abre PowerShell **como administrador** y ejecuta el siguiente comando:

```powershell
irm https://raw.githubusercontent.com/lennynT219/Lennyn-Nvim/refs/heads/main/IDE-nvim.ps1 | iex
```

Este comando:

- Descarga el script `IDE-nvim.ps1` desde GitHub
- Lo ejecuta directamente sin necesidad de guardarlo

---

## ♻️ 4. Reiniciar terminal y ejecutar Neovim

Una vez completado el script:

```powershell
nvim
```

¡Y listo! Verás tu Neovim completamente personalizado.

---

## 💻 Terminal recomendada

- [**Warp**](https://www.warp.dev/) – para usuarios de Mac y Linux (uso personal)
- [**Windows Terminal**](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) – ideal para usuarios Windows

---

## 📦 ¿Qué incluye esta configuración?

- Plugins optimizados con lazy.nvim
- Soporte para TypeScript, Lua, Rust y más
- UI moderna, iconos bonitos, y rendimiento rápido
- Config lista para desarrollo real (LSPs, linters, formatter, Git)

---

## 🧙‍♂️ ¿Problemas?

Si tienes algún error con el script, asegúrate de:

- Ejecutar PowerShell como **Administrador**
- Usar la versión 7 o superior (`$PSVersionTable.PSVersion`)
- Tener conexión a internet
