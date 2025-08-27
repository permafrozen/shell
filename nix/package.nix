{ pkgs, quickshell, ... }:
pkgs.stdenv.mkDerivation {
  pname = "shell";
  version = "0.0.1";
  nativeBuildInputs = [ pkgs.makeWrapper ];
  unpackPhase = ":";
  installPhase = ''
    mkdir -p $out/bin
    cp -r ${quickshell}/bin/quickshell $out/bin/shell
    wrapProgram $out/bin/shell \
      --add-flags "-p ${../src}"
  '';
}
