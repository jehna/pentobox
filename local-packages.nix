pkgs:
  {
    my-terminal-config = pkgs.callPackage ./packages/my-terminal-config.nix { };
    burpsuite = pkgs.callPackage ./packages/burpsuite.nix { };
  }