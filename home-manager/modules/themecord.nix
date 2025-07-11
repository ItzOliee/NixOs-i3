{ config, lib, pkgs, ... }:

let inherit (lib) mkEnableOption mkIf;
in {
  options.themecord.enable = mkEnableOption "Themecord Discord theme injector";

  config = mkIf config.themecord.enable {
    home.packages = [
      (pkgs.stdenv.mkDerivation rec {
        pname = "themecord";
        version = "1.1.0";


        src = pkgs.fetchFromGitHub {
          owner = "danihek";
          repo = "Themecord";
          rev = "refs/tags/1.1.0";
          sha256 = "vwrIULP9VmYqhNtHcNaPat6OjKqbDgwf3qSypOusG9c=";
        };


     nativeBuildInputs = [ pkgs.nodejs ];

        buildPhase = "true";

installPhase = ''
  mkdir -p $out/bin
  cp -r . $out/app

  cat > $out/bin/themecord <<EOF
  #!${pkgs.runtimeShell}
  cd $out/app
  exec ./themecord "\$@"
  EOF

  chmod +x $out/bin/themecord
  chmod +x $out/app/themecord
'';
        meta = with pkgs.lib; {
          description = "Custom CSS theme loader for Discord (Themecord)";
          homepage = "https://github.com/danihek/Themecord";
          license = licenses.mit;
        };
      })
    ];
  };
}
