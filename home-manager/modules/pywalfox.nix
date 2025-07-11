{ config, pkgs, lib, ... }:

let
  # Your existing pywalfox path (adjust as needed)
  pywalfoxPath = "/run/current-system/sw"; # or wherever pywalfox is installed

  # Or better, expose it as a module option for flexibility
in {

  options.pywalfox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable pywalfox configuration without installing the package.";
    };

    nativeMessagingHostsPath = lib.mkOption {
      type = lib.types.str;
      default = "${config.xdg.configHome}/mozilla/native-messaging-hosts";
      description = "Path for native messaging hosts JSON files";
    };
  };

  config = lib.mkIf config.pywalfox.enable {
    # Just manage the native messaging host JSON file for Firefox or other browsers
    home.file."${config.pywalfox.nativeMessagingHostsPath}/frewacom.pywalfox.json" = {
      text = ''
        {
          "name": "frewacom.pywalfox",
          "description": "Pywalfox Native Messaging Host",
          "path": "${pywalfoxPath}/bin/main.sh",
          "type": "stdio",
          "allowed_extensions": [ "frewacom.pywalfox" ]
        }
      '';
      # Make sure parent dir exists
      directory = true;
      executable = false;
    };

    # You can add more config files or directories here if needed
  };
}
