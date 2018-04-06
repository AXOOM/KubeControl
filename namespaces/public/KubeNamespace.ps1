Class KubeNamespace {
  [int] $Index;
  [string] $Name;
  [string] $Status;
  [DateTime] $Created;

  KubeNamespace([int] $indexIn, [string] $nameIn, [string] $statusIn, [DateTime] $createdIn) {
    $this.Index = $indexIn;
    $this.Name = $nameIn;
    $this.Status = $statusIn;
    $this.Created = $createdIn;
  }
}