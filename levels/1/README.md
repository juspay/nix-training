# Level 1

## Nix Store

### Store Paths

- Files & folders under `/nix/store` each with unique hash
- CLI to create these:
    ```
    nix store add-file
    nix store add-path
    nix store delete

    # Downloaded off internet
    nix store prefetch-file https://nammayatri.in/
    ```

### Derivation

- `.drv`: Recipes or functions that knows how to produce a store path, using nothing but other store paths as input.
- `nix-build` (or `:b` in `nix repl`) will evaluate the derivation to produce the output in the Nix store.

## Writing Nix to produce derivations

### Builtin

Simplest example,

```sh
nix-build -E '
    derivation {
        name="test"; 
        src=./.; 
        builder="/bin/bash"; 
        system="aarch64-darwin"; 
        args=["-c" "echo Hello > $out"];
    }'
```

### `mkDerivation`

That's too lowel, though. Let's use nixpkgs (the "standard library" of Nix)

```nix
let 
    pkgs = import <nixpkgs> {};
in 
    pkgs.stdenv.mkDerivation {
        name = "test";
        src = ./.;
        installPhase = ''
            echo Hello > $out
        '';
    }
```

### `runCommand`

Let's go one step higher:

### `writeFile`

Even higher.

## process-compose example!

pc.nix