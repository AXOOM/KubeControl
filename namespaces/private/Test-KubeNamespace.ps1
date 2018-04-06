function Test-KubeNamespace([string] $namespace) {
  if (Get-KubeNamespaces | Where-Object { $_.Name -eq $namespace } ) {
    return true
  }

  return false
}