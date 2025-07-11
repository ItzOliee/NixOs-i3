{ config, lib, pkgs, ... }:

{
  options = {
    nvidia.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable NVIDIA proprietary driver and configuration.";
    };
  };

  config = lib.mkIf config.nvidia.enable {
    # Use the NVIDIA proprietary driver
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;  # Proprietary driver needed for RTX 3080
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable OpenGL support
    hardware.opengl.enable = true;

    # Optional: include CUDA toolkit
    environment.systemPackages = with pkgs; [
      cudaPackages.cudatoolkit
      pkgs.linuxPackages.nvidia_x11.settings
    ];
  };
}
