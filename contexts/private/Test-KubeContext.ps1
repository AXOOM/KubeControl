function Test-KubeContext($context) {
  $existingContexts = Get-KubeContexts
  return $existingContexts | Where-Object { $_.Name -eq $context }
}