function Get-KubeNamespaces {
  $response = kubectl get namespaces -ojson --sort-by='metadata.name' | ConvertFrom-Json 

  $namespaces = @()
  foreach ($item in $response.items ) {
    $creationDate = Get-Date -Format (Get-Culture).DateTimeFormat.UniversalSortableDateTimePattern -Date $item.metadata.creationTimestamp
    $namespaces += [KubeNamespace]::new($response.items.IndexOf($item)+1, $item.metadata.name, $item.status.phase, $creationDate)
  }

  return $namespaces
}