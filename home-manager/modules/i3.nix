{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      window.border = 0;

      gaps = {
        inner = 10;
        outer  = 3;
       };

       startup = [
        {
          command = "exec xrandr --output Virtual-1 --mode 1920x1080";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
