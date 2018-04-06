function Get-KubeContexts {
  
  <# 
    .Synopsis
     List kubernetes contexts

    .Description
     Returns a list of available kubernetes contexts

    .Example
     # Get a list of existing environments
     Get-KubeContexts
  #>

  $contexts = Get-Content -Path $env:KUBECONFIG -Raw | Convert-YamlToJson | ConvertFrom-Json | Select-Object -Expand contexts | Sort-Object -Property Name

  $table = @()
  foreach ($context in $contexts) {
    $index = $contexts.IndexOf($context)
    $name = $context.Name
    $cluster = ($context | Select-Object -Expand context).Cluster
    $table += [KubeContext]::new(($index + 1), $name, $cluster)
  }
  
  return $table
}