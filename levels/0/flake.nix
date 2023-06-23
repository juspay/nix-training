# Nix is essentially JSON + Functions
# 
# Like JSON hash maps, we have "attribute sets" (attrsets) in Nix, which are of
# the syntax `{..}`. A flake is one big attrset with two keys, `inputs` and
# `outputs`, following a specific schema (like JSON schema), that the `nix *`
# commands respect.
#
# Run `nix repl` for nix repl.
#
# Run `nix flake show` to view what this flake outputs.

{
  inputs = {
    ny.url = "github:nammayatri/nammayatri/4865978";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = inputs:
    let
      # TODO: Change this to 
      #   - "x86_64-darwin" if you are on Intel mac
      #   - "x86_64-linux" if you are on Linux
      system = "aarch64-darwin";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      # To evaluate these values, run `nix eval .#demo`
      # Or, say, `nix eval .#demo.aPath`.
      demo = rec {
        aList = [ 1 2 3 ];
        aString = "hello";
        aPath = ../1;
        aFunction = x: x + 1; # Unlike JSON, we can define functions.
        aNestedAttrset = { a = 1; b = 2; };
        ${system} = "keys can be variables too";

        inherit (aNestedAttrset) a;
        aInterpolatedString = "${aString} world";
      };


      packages.${system} = {
        # To build this package, run "nix build"
        default =
          inputs.ny.packages.${system}.nammayatri;

        # Build a simple docker image
        # To create the image: `docker load -i $(nix build .#dockerImage --print-out-paths)`
        # NOTE: This works only on Linux
        dockerImage =
          pkgs.dockerTools.buildImage {
            name = "nix-demo";
            copyToRoot = pkgs.buildEnv {
              name = "nix-demo";
              paths = [
                pkgs.cowsay
                pkgs.bashInteractive
                pkgs.coreutils
              ];
            };
          };
      };

      # To run this app, run "nix run .#foo"
      apps.${system}.foo = {
        type = "app";
        program = pkgs.lib.getExe (pkgs.writeShellApplication {
          name = "foo";
          runtimeInputs = [ pkgs.cowsay ];
          text = ''
            cowsay Moo!!!!
          '';
        });
      };

      # To enter this dev shell, run "nix develop"
      devShells.${system}.default =
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
    };
}
