function Set-KubeContext ($context) {
  if (-Not (Test-KubeContext $context)) {
    Write-Error "The Kubernetes context `"$context`" does not exist"
    return
  }

  kubectl config use-context "$context"
}