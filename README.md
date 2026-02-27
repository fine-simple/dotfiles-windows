# Windows Dotfiles (chezmoi)

This repository contains my personal Windows dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setting Up a New Windows Machine

### 1. Install chezmoi

Open **PowerShell** and install chezmoi via winget:

```powershell
winget install twpayne.chezmoi
```

Restart your terminal (or refresh the PATH) after installation:

```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
```

### 2. Configure Git & SSH

Make sure Git is installed:

```powershell
winget install Git.Git
```

Set up your Git identity:

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

If the remote uses SSH, ensure your SSH key is added to your agent and to GitHub:

```powershell
# Start the SSH agent
Start-Service ssh-agent

# Add your key (adjust path if needed)
ssh-add "$env:USERPROFILE\.ssh\id_ed25519"
```

### 3. Initialize chezmoi from this Repository

```powershell
chezmoi init git@github.com:fine-simple/dotfiles-windows.git
```

> If you use HTTPS instead:
> ```powershell
> chezmoi init https://github.com/fine-simple/dotfiles-windows.git
> ```

### 4. Preview Changes (Optional but Recommended)

Before applying, review what chezmoi would change:

```powershell
chezmoi diff
```

### 5. Apply the Dotfiles

```powershell
chezmoi apply
```

---

## Day-to-Day Usage

| Task | Command |
|------|---------|
| Pull latest changes and apply | `chezmoi update` |
| Edit a managed file | `chezmoi edit <file>` |
| Add a new file to be managed | `chezmoi add <file>` |
| See pending changes | `chezmoi diff` |
| Open the source directory | `chezmoi cd` |

## What's Managed

| Path | Description |
|------|-------------|
| `~/.wslconfig` | WSL2 configuration |
| `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | PowerShell profile |
| `~/.config/yasb/` | YASB status bar config |
| `~/.glzr/glazewm/` | GlazeWM tiling window manager config |
