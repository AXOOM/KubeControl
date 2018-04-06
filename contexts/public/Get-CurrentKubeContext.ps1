function Get-CurrentKubeContext {

  <# 
    .Synopsis
     Show current kubernetes context

    .Description
     Shows the current kubernetes context

    .Example
     Get-CurrentKubeContext
  #>

  if ((Get-Content -Path $env:KUBECONFIG -Raw) -imatch 'current-context:\s*(.*)') {
    return $Matches[1]
  }

  return "unknown"
}