{ pkgs, quickshell, ... }:
pkgs.stdenv.mkDerivation {
  pname = "schnell";
  version = "0.0.1";
  nativeBuildInputs = [ pkgs.makeWrapper ];
  unpackPhase = ":";
  installPhase = ''
    mkdir -p $out/bin
    cp -r ${quickshell}/bin/quickshell $out/bin/schnell
    wrapProgram $out/bin/schnell \
      --add-flags "-p ${../src}"
  '';
}
