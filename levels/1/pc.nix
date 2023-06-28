# nix-build pc.nix -A myapp -o myapp
# ./myapp
let
  pkgs = import <nixpkgs> { };
in
rec {
  configFile = pkgs.writeTextFile {
    name = "pc.yaml";
    text = builtins.toJSON {
      processes = {
        clock = {
          command = ''
            bash -c "while true; do date; sleep 1; done"
          '';
        };
      };
    };
  };

  pc = pkgs.process-compose;

  myapp = pkgs.writeShellScript "myapp" ''
    ${pc}/bin/process-compose -f ${configFile} $*
  '';

  # TODO: dockerImage (Linux only)
}

# TODO: Exercise.
# Reproduce the sqlite-web demo from ../0/process-compose but in this file.