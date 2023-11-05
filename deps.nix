pkgs:
  let
    all = pkgs // import ./local-packages.nix pkgs;
  in
    with all;

      [
        bash
        ghidra
        my-terminal-config
        git
        gobuster
        burpsuite
        git-dumper
      ]