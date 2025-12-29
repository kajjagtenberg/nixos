{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nfs-utils
    pciutils
  ];
}
