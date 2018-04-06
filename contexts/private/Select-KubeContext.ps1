function Select-KubeContext {
  Write-Host "Please choose a Kubernetes context:"
    
  $contexts = Get-KubeContexts
  $contexts | Format-Table -View Indexed -AutoSize | Out-Host

  $choice = Read-Host "Your choice (#)"
  if ($choice -notmatch '\d' -or [int]$choice -lt 1 -or [int]$choice -gt $contexts.Length) {
    Write-Error "Invalid option"
    return
  }

  return $contexts[[int]$choice - 1].Name
}