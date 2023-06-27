let
  pkgs = import <nixpkgs> { };
in
rec {
  configFile = pkgs.writeTextFile {
    name = "pc.yaml";
    text = builtins.toJSON {
      processes = {
        hello = {
          command = "echo Hello";
        };
      };
    };
  };

  pc = pkgs.process-compose;

  app = pkgs.writeShellScript "myapp" ''
    ${pc}/bin/process-compose -f ${configFile} $*
  '';

  # TODO: dockerImage
}

# TODO: Exercise.
