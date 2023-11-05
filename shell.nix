{ pkgs ? import <nixpkgs> {} }:
  let
    local = import ./local-packages.nix pkgs;
  in
    pkgs.mkShell {
      nativeBuildInputs = import ./deps.nix pkgs;
      shellHook = ''source ${local.my-terminal-config}/.config/bash/main.bash;
                    PS1="👹$PS1"; # Differentiate the shell from the default one
                  '';
  }