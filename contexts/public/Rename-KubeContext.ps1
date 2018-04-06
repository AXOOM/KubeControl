function Rename-KubeContext {

  <# 
    .Synopsis
     Rename a kubectl context from the kubeconfig file.

    .Description
     Renames a kubectl context from the kubeconfig file.

    .Parameter CurrentName
     Is the context name that you whish to change.

    .Parameter NewName
     Is the new name you wish to set.

    .Example
     # Rename the context 'old-name' to 'new-name' in your kubeconfig file.
     Rename-KubeContext -CurrentName old-name -NewName new-name
     # or
     Rename-KubeContext old-name new-name
     
  #>

  Param(
    [Parameter(Mandatory = $True)][string]$CurrentName,
    [Parameter(Mandatory = $True)][string]$NewName
  )

  if (-Not (Test-KubeContext $CurrentName)) {
    Write-Error "The Kubernetes Context `"$CurrentName`" does not exist"
    return
  }

  kubectl config rename-context "$CurrentName" "$NewName"
}