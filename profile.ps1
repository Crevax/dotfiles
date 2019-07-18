if (Test-Path "$PSScriptRoot\employer-specific.ps1" -PathType Leaf) {
    . $PSScriptRoot\employer-specific.ps1
}

function Get-GitColor () {
    $status = git status

    if (-not ($status -Like "*working tree clean*")) {
        return "red"
    } elseif ($status -Like "*Your branch is ahead*") {
        return "yellow"
    }

    return "cyan"
}

function Write-BranchName () {
    $branch =$(git branch) -replace "^\*\s", ""

    if ($branch -ne "") {
        $color = Get-GitColor
        Write-Host " ($branch)" -ForegroundColor $color -NoNewLine
    } else {
        Write-Host " (no branches)" -ForegroundColor "cyan" -NoNewLine
    }
}

function prompt {
    $Host.UI.RawUI.WindowTitle = $(Get-Location)

    $path = Split-Path -Leaf $(Get-Location)

    if (Test-Path (git rev-parse --git-dir)) {
        Write-Host $path -NoNewLine
        Write-BranchName
    } else {
        Write-Host $path -NoNewLine
    }

    return ">"
}
