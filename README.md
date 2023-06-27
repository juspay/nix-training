# Nix training

> **Note**
>
> This is **work-in-progress** 🚧.

## Outline

| Level | Title | Description |
| --- | --- | --- |
| [0](./levels/0/README.md) | Intro | Demos for motivation |
| [1](./levels/1/README.md) | Nix foundations | Nix store, the language, standard library, derivations; `pc.nix` |
| 2 | Flakes | Reproduce `pc.nix` in flake; Nixify full Rust project with devShell |
| 3 | Module system | Write a module to simplify the Rust flake |
| 4 | flake-parts | Convert that Rust project from level 2/3 to use flake-parts. Make a mono repo, and add frontend (eg: rescript), with its own flake-parts module - Combine the two modules at top-level flake (like we do for nammayatri). |
| 5 | Advanced | Write your own flake-parts modules (use process-compose/mission-control module as examples) |