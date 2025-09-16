{ pkgs, ... }: {
  hardware.amdgpu.opencl.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      rocm-smi
      rocminfo
    ];
  };

  services.rocm.enable = true;
}
