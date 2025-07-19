{ pkgs, quickshell, ... }:

pkgs.mkShell {
  packages = [
    quickshell
    pkgs.qt6.qtdeclarative
    pkgs.inotify-tools
  ];
  shellHook = ''
    export QMLLS_BUILD_DIRS=${pkgs.qt6.qtdeclarative}/lib/qt-6/qml/:${quickshell}/lib/qt-6/qml/
    export QML_IMPORT_PATH=$PWD/src
  '';
}
