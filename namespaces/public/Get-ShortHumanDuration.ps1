function Get-ShortHumanDuration {

  Param(
    [Parameter(Mandatory = $True)][TimeSpan] $Duration
  )

  if ($Duration.TotalSeconds -lt 60) {
      return "$([int]$Duration.TotalSeconds)s"
  } elseif ($Duration.TotalMinutes -lt 60) {
      return "$([int]$Duration.TotalMinutes)m"
  } elseif ($Duration.TotalHours -lt 24) {
      return "$([int]$Duration.TotalHours)h"
  } elseif ($Duration.TotalDays -lt 365) {
      return "$([int]$Duration.TotalDays)d"
  } else {
      return "$([int]($Duration.TotalDays / 365))y"
  }
}