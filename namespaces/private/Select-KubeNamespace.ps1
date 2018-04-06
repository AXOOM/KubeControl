function Select-KubeNamespace {
  Write-Host "Please choose a Kubernetes namespace:"
    
  $namespaces = Get-KubeNamespaces
  $namespaces | Format-Table -View Indexed -AutoSize | Out-Host

  $choice = Read-Host "Your choice (#)"
  if ($choice -notmatch '\d' -or [int]$choice -lt 1 -or [int]$choice -gt $namespaces.Length) {
    Write-Error "Invalid option"
    return
  }

  return $namespaces[[int]$choice - 1].Name
}