function Use-KubeNamespace {
  [CmdletBinding()]
  Param()
  DynamicParam {
    return New-DynamicParam -ParameterName Name -Values (Get-KubeNamespaces | Select-object -ExpandProperty Name )
  }

  begin {
    $Name = $PsBoundParameters["Name"]
  }

  process {
    if (-Not $Name) {
      $Name = Select-KubeNamespace
    }

    if ($Name -eq '-') {
      kubectl config set-context "$(Get-CurrentKubeContext)" --namespace="default"
    }
    
    kubectl config set-context $(Get-CurrentKubeContext) --namespace="$Name"
  }
}