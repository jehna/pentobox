{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = [
      pkgs.bash # The MacOS bash is very old, so this way we get a more recent one
      pkgs.metasploit
      pkgs.nmap
      pkgs.ghidra
    ];
    shellHook = "source ~/.config/bash/main.bash;

                 PS1=\"👹$PS1\";"; # Differentiate the shell from the default one
}