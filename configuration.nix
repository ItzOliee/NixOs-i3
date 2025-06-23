{ config, pkgs, ... }:

let
  # Custom SilentSDDM theme package
  silentSddmTheme = pkgs.stdenv.mkDerivation {
    pname = "silent-sddm-theme";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "uiriansan";
      repo = "SilentSDDM";
      rev = "main";  # Pin to a specific commit or tag if you want stable
      sha256 = "sha256-1ssbpphvfky5l8d1p7g7yy4rlqjxvcp2gqk7wq6y5c4dxg7fgq08"; # Replace with actual hash from nix-prefetch-git
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes/default
      cp -r $src/themes/default/* $out/share/sddm/themes/default/
    '';

    meta = with pkgs.lib; {
      description = "SilentSDDM default theme for SDDM";
      homepage = "https://github.com/uiriansan/SilentSDDM";
      license = licenses.mit;
      maintainers = with maintainers; [ ];
    };
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  # Hostname
  networking.hostName = "draconix";

  # Networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/London";

  # Locale
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # X11 and window manager + display manager
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "none+i3";
    displayManager.theme = "default";  # Set SDDM theme here
  };

  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # Uncomment if needed
  };

  # Console keymap
  console.keyMap = "uk";

  # User
  users.users.oli = {
    isNormalUser = true;
    description = "oli";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    silentSddmTheme  # Add the SilentSDDM theme package here
  ];

  # Activation script to copy theme files to /usr/share/sddm/themes
  system.activationScripts.copySilentSddmTheme = {
    text = ''
      mkdir -p /usr/share/sddm/themes
      cp -r ${silentSddmTheme}/share/sddm/themes/default /usr/share/sddm/themes/
    '';
  };

  # System version
  system.stateVersion = "25.05";
}
