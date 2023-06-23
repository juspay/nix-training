# Nix training

## Levels

- [Level 0](./levels/0/README.md)


## Outline

### Level 0  (today)
**Intro**, demos, motivation

### Level 1
**Nix foundations** (the language, standard library, derivations)

### Level 2
**Flakes** 
- connect two flakes, flake outputs, access nixpkgs packages, devShells
    - Package a Rust project with dev shell (inspired by #nix-browser learnings)

### Level 3
**Module system** (writing modules; NixOS modules; hm modules)

### Level 4
**flake-parts**
- Convert that Rust project from level 2 to use flake-parts.
- Make a mono repo, and add frontend (eg: rescript), with its own flake-parts module
- Combine the two modules at top-level flake (like we do for nammayatri).

#### Level 5 (advanced)
Write **your own flake-parts modules** 
(use process-compose/mission-control module as examples)