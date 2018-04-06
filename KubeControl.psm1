$ErrorActionPreference = "Stop";
$env:KUBECONFIG = Join-Path -Path $env:USERPROFILE -ChildPath ".kube\config"

Try { & kubectl | Out-Null } Catch { throw "kubectl is not installed" }

$Public = @( Get-ChildItem -Path $PSScriptRoot\contexts\public\*.ps1 )
$Public += Get-ChildItem -Path $PSScriptRoot\namespaces\public\*.ps1
$Private = @( Get-ChildItem -Path $PSScriptRoot\contexts\private\*.ps1 )
$Private += Get-ChildItem -Path $PSScriptRoot\namespaces\private\*.ps1
$Private += Get-ChildItem -Path $PSScriptRoot\private\*.ps1

Foreach ($import in @($Public + $Private)) {
  Try {
    . $import.fullname
  }
  Catch {
    Write-Error -Message "Failed to import function $($import.fullname): $_"
  }
}

Export-ModuleMember -Function $Public.Basename
