{ pkgs ? import <nixpkgs> { }
, pkgsLinux ? import <nixpkgs> { system = "x86_64-linux"; }
}:

pkgs.dockerTools.buildImage {
  name = "pentonix";
  tag = "latest";

  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = import ./deps.nix pkgsLinux;
    pathsToLink = [ "/bin" ];
  };


  config = {
    Cmd = [ "/bin/bash" ];
  };

}
