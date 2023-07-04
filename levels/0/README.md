# Level 0

In this level, we will see the various things Nix is capable of. This provides the needed motivation for learning Nix.

WIP: Outline
- [x] Nix as a package manager
- [x] Isolated development environments
- [x] Process runner 
- [x] Building docker images
- [ ] Linux distribution (NixOS)
- [ ] Dotfile manager (home-manager)

## Nix as a package manager

At its basic level, Nix is a package manager. It is capable of installing packages from the [Nixpkgs][nixpkgs] repository, which is a collection of packages maintained by the NixOS community.

Search for a package,

```sh
# nix search nixpkgs <keyword>
nix search nixpkgs ripgrep
```

Installing a package (to your home directory),

```sh
nix profile install nixpkgs#ripgrep
```

**Warning** The above command will imperatively install the package. It is not recommended to use this command. We will see a better way to install packages in the NixOS and home-manager section.

## Isolated development environments

Nix is capable of creating isolated development environments for your project. All of your project dependencies are available from this environment, without polluting your global environment.

Creating a development environment (aka. `devShell`) is simple in Nix. 

![[devshell/README]]


## Process runner

And now for something completely different. Nix can not only build packages, but also build their configuration files. The whole thing can in turn be wrapped in script (another Nix package). We'll package up and run a bunch of processes using [process-compose](https://github.com/F1bonacc1/process-compose).

![[process-compose/README]]

## Building docker image

Docker images can be created (via `docker load`) from tarballs, and Nix can build these tarballs just like regular packages.

![[docker-image/README]]


[nixpkgs]: https://zero-to-nix.com/concepts/nixpkgs