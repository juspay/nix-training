let
  pkgs = import <nixpkgs> { };
in
  pkgs.writeShellScript "nix-build-show" ''
    set -euo pipefail
    echo "> nix-build --no-out-link $*"
    STORE_PATH=$(nix-build --no-out-link $*)
    ${pkgs.exa}/bin/exa -T $STORE_PATH
  ''
