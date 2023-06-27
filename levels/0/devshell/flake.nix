{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      perSystem = { self', pkgs, lib, ... }: {
        # To enter this dev shell, run "nix develop"
        devShells.default =
          pkgs.mkShell {
            name = "level-0";
            nativeBuildInputs = [
              pkgs.cowsay
              pkgs.cabal-install
              pkgs.ghc
              pkgs.nil
              pkgs.htop
            ];
            shellHook = ''
              echo "You are in nix dev shell"
              echo "Run 'htop' to see the processes"
            '';
          };

        # To run this app, run "nix run .#foo"
        apps.foo.program = pkgs.writeShellApplication {
          name = "foo";
          runtimeInputs = [ pkgs.cowsay ];
          text = ''
            cowsay Moo!!!!
          '';
        };

      };
    };
}
