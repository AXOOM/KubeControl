Class KubeContext {
  [int] $Index;
  [string] $Name;
  [string] $Cluster;

  KubeContext([int] $IndexIn, [string] $NameIn, [string] $ClusterIn) {
    $this.Index = $IndexIn;
    $this.Name = $NameIn;
    $this.Cluster = $ClusterIn;
  }
}