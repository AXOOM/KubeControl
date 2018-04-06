function Use-KubeContext {

   <# 
    .Synopsis
     Use kubectl context.

    .Description
     Use kubectl context. Afterwards you can type kubectl commands for the selected kubernetes cluster.

    .Example
     # Get a list of existing contexts to choose from.
     Use-KubeContext
    
    .Example
     # Use context "test":
     Use-KubeContext test
  #>

  [CmdletBinding()]
  Param()
  DynamicParam {
    return New-DynamicParam -ParameterName Name -ParameterDescription 'Name of the context' -Values (Get-KubeContexts | Select-object -ExpandProperty Name)
  }

  begin {
    $Name = $PsBoundParameters.Name
  }

  process {
    if (-Not $Name) {
      $Name = Select-KubeContext
    }

    if (-Not (Test-KubeContext $Name)) {
      Write-Error "The Kubenertes context `"$Name`" does not exist"
      return
    }

    Set-KubeContext $Name
  }
}