# Using flake-parts to set up a devshell

## Requirements
1. flake-enabled nix - copy the installation shell script from nix-installer if you haven't installed it already.
2. direnv - if you haven't installed it already:
* Use the direnv package from nixpkgs, e.g. with nix profile install nixpkgs#direnv.
* Add eval "$(direnv hook bash)" to your .bashrc or eval "$(direnv hook bash)" to your .zshrc.
3. I assume an existing git repository. If not at hand, create a new directory and execute git init.

## Adding Nodejs

```nix
# flake.nix
# ...
    imports = [
      ./flake-modules/nodejs-packages.nix
      ./flake-modules/nodejs-devshell.nix
    ];
# ...
```

## Quickly check for errors

```sh
nix flake check
```

## Test the runtime

```sh
nix run `.#nodejs`
```

## Enter the devshell

```sh
nix develop
```
