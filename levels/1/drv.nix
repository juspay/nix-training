let
  pkgs = import <nixpkgs> { };
in
rec {
  # Single file
  aFile1 = pkgs.writeTextFile {
    name = "aFile";
    text = "Single file path";
  };

  aFile2 = pkgs.runCommand "aFile" { } ''
    echo "Single file path" > $out
  '';

  # A folder
  aFolder = pkgs.runCommand "aFolder" { } ''
    mkdir -p $out
    echo "Hello, world!" > $out/someFile
    echo "Hello, world!!!!" > $out/anotherFile
    ln -sf ${aFile2} $out/aFile
    # NOTE: network accessible not possible, as drvs are sandboxed
  '';

  # Downloaded off the internet
  downloadedZip = pkgs.fetchzip {
    url = "https://github.com/readmeio/import-samples/raw/master/import-sample-single-version.zip";
    sha256 = "sha256-uqMV+1AyXtJcs3C7NacEjhK+dDKj9QDwxOPS6sgtZlY=";
  };
  # ^ There is also `pkgs.fetchgit` to download off Git repo.
  # But you should generally prefer flake inputs (the rev and hash is tracked in `flake.lock`).

  # Can also just be local paths
  myself = ./.;

  # Run arbitrary transformation from one path to another
  converted = pkgs.stdenv.mkDerivation {
    name = "nix-html";
    buildInputs = [ pkgs.highlight ];
    src = ./.;
    installPhase = ''
      mkdir -p $out
      highlight -d $out $src/drv.nix
    '';
  };

  gcc = pkgs.gcc;

  someBinary = pkgs.stdenv.mkDerivation {
    name = "some-binary";
    src = ./c;
    buildInputs = [ pkgs.gcc ];
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/bin
      cd $src
      gcc main.c -o $out/bin/some-binary
    '';
  };

  someShell = pkgs.mkShell {
    name = "some-shell";
    nativeBuildInputs = [ 
      pkgs.htop 
      someBinary
    ];
  };
}
