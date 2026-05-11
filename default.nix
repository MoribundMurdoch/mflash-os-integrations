{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "mflash-common";
  version = "1.0.0";

  src = ./.;

  # Nix packages need these dependencies to function
  buildInputs = [ pkgs.unzip pkgs.shared-mime-info ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/mime/packages
    mkdir -p $out/share/thumbnailers
    mkdir -p $out/share/licenses/mflash-common

    # Copy the core files into the Nix store
    cp linux/thumbnailer/mflash-thumbnailer $out/bin/
    cp linux/thumbnailer/mflash.xml $out/share/mime/packages/
    cp linux/thumbnailer/mflash.thumbnailer $out/share/thumbnailers/
    cp LICENSE $out/share/licenses/mflash-common/
  '';

  meta = with pkgs.lib; {
    description = "Native Linux system integrations for the .mflash deck format";
    homepage = "https://github.com/deo-user/mflash-os-integrations";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
