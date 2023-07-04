# Nix training

> **Note**
>
> This is actively a **work-in-progress** 🚧.

## Goal

This training series will start with a bunch of demos--the cool things [Nix](https://nixos.org/) can do--to motivate the user. Then we iteratively build up on Nix knowledge, starting with the foundations, then going on to flakes, and thereon to the module system which is necessary for understanding flake-parts that is integral to many real-world projects using Nix.

The goal is to enable the audience to work towards grasping all the concepts involved in writing and creating the likes of [haskell-template](https://github.com/srid/haskell-template/blob/master/flake.nix) or [haskell-flake](https://github.com/srid/haskell-flake), and more generally get comfortable with writing Nix.

## Prerequisites

You must have Nix installed on your system. We recommend [the Determinate installer](https://github.com/DeterminateSystems/nix-installer). You can of course also install [NixOS](https://nixos.org/) (a Linux distribution based on Nix) if you are feeling adventurous.

## Outline

| Level | Title | Description |
| --- | --- | --- |
| [0](./levels/0/README.md) | Intro | Demos for motivation |
| [1](./levels/1/README.md) | Nix foundations | Nix store, the language, standard library, derivations; `pc.nix` |
| 2 | Flakes | Reproduce `pc.nix` in flake; Nixify full Rust project with devShell |
| 3 | Module system | Write a module to simplify the Rust flake |
| 4 | flake-parts | Convert that Rust project from level 2/3 to use flake-parts. Make a mono repo, and add frontend (eg: rescript), with its own flake-parts module - Combine the two modules at top-level flake (like we do for nammayatri). |
| 5 | Advanced | Write your own flake-parts modules (use process-compose/mission-control module as examples) |

## Structure of a level

Each level includes a video presentation with hands-on demo of the code involved. They also include:

- Further readings
- Exercises
