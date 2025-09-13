{
  ...
}:
{
  fileSystems."/mnt/fast" = {
    device = "10.0.0.94:/mnt/fast/k8s";
    fsType = "nfs";
    options = [
      "rw"
      "vers=4"
    ];
  };
}
