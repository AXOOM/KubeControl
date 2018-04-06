function Get-CurrentKubeNamespace {
  $config = Get-Content -Path $env:KUBECONFIG -Raw | Convert-YamlToJson | ConvertFrom-Json

  $namespace = ($config.contexts | Where-Object { $_.Name -eq $config.'current-context' } | Select-Object -Expand context).Namespace

  if ($namespace -eq $null) {
    return "default"
  }

  return $namespace
}