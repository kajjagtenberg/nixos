{ ... }: {
  fileSystems."/mnt/fast" = {
    device = "10.0.0.94:/mnt/fast";
    fsType = "nfs";
    options = [ "rw" "vers=4" ];
  };

  fileSystems."/mnt/disposable/media" = {
    device = "10.0.0.94:/mnt/disposable/media";
    fsType = "nfs";
    options = [ "rw" "vers=4" ];
  };
}
