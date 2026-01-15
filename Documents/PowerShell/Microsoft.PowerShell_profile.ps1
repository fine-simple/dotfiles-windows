if (-not (ssh-add -l | Select-String -Quiet ".")) {
    # Load all private keys in ~/.ssh
    Get-ChildItem "$HOME\.ssh\keys" -File |
        ForEach-Object { ssh-add $_.FullName }
}
