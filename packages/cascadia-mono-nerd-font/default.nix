{ lib, stdenv, fetchgit, fontconfig, xorgFonts }:

stdenv.mkDerivation rec {
  pname = "cascadia-mono-nerd-font";
  version = "20221027"; # Adjust the version as needed.

  src = fetchgit {
    url = "https://github.com/mrivnak/CascadiaMono-Nerd-Font.git";
    rev = "84dfe24b28a29945a56e4d3a03793596fd09658a"; # Use a specific commit hash or tag.
    sha256 = "0a2r4y5bcybc9m4w31ib6pmvjvf705mbhm15y3w2wjxh6425i4ym"; # Generate with `nix-prefetch-git`.
  };

  noUnpackFonts = true;

  meta = with lib; {
    description = "Monospaced font that includes programming ligatures and is designed to enhance the modern look and feel of the Windows Terminal";
    homepage = "https://github.com/microsoft/cascadia-code";
    license = licenses.ofl;
  };

  # Install the font into the system's font directory.
  postInstall = ''
    mkdir -p $out/share/fonts
    cp -r $src $out/share/fonts
  '';
}
