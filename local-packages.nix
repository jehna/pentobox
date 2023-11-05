pkgs:
  {
    my-terminal-config = pkgs.callPackage ./packages/my-terminal-config.nix { };
    burpsuite = pkgs.callPackage ./packages/burpsuite.nix { };
    git-dumper = pkgs.callPackage ./packages/git-dumper.nix { };
  }