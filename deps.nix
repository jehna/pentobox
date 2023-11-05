pkgs:
  let
    all = pkgs // import ./local-packages.nix pkgs;
  in
    with all;

      [
        bash
        my-terminal-config
      ]