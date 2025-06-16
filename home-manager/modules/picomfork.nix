self: super: {
  picom = super.picom.overrideAttrs (oldAttrs: rec {
    pname = "picom-ibhagwan";
    version = "next-rebase";

    src = super.fetchFromGitHub {
      owner = "ibhagwan";
      repo = "picom";
      rev = "next-rebase";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace after first build
    };

    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.pkg-config ];
    buildInputs = oldAttrs.buildInputs ++ [ super.libX11 super.libXext ];
  });
}
