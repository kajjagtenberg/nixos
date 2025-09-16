{ pkgs, ... }: {
  hardware.amdgpu.opencl.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.rocm-smi
      rocmPackages.rocminfo
    ];
  };
}
