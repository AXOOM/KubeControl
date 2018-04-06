function New-DynamicParam {
    Param(
      [Parameter(Mandatory = $True)][string]$ParameterName,
      [Parameter(Mandatory = $True)][string[]]$Values,
      [Parameter(Mandatory = $False)][string]$ParameterSetName="__AllParameterSets",
      [Parameter(Mandatory = $False)][string]$ParameterDescription,
      [Parameter(Mandatory = $False)][bool]$Mandatory,
      [Parameter(Mandatory = $False)][int]$Position
    )
  
    # Create the dictionary 
    $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
  
    # Create the collection of attributes
    $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
          
    # Create and set the parameters' attributes
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.ParameterSetName = $ParameterSetName
    
    if ($Mandatory) {
      $ParameterAttribute.Mandatory = $Mandatory
    }
  
    if ($Position -ne $null) {
      $ParameterAttribute.Position = $Position
    }
  
    if ($ParameterDescription) {
      $ParameterAttribute.HelpMessage = $ParameterDescription
    }
  
    # Add the attributes to the attributes collection
    $AttributeCollection.Add($ParameterAttribute)
  
    # Generate and set the ValidateSet 
    $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($Values)
  
    # Add the ValidateSet to the attributes collection
    $AttributeCollection.Add($ValidateSetAttribute)
  
    # Create and return the dynamic parameter
    $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
    $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
    return $RuntimeParameterDictionary
  }