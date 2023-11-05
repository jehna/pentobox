{ lib
, stdenv
, fetchFromGitHub
, python3
}:

let
  src = fetchFromGitHub {
    owner = "defparam";
    repo = "smuggler";
    rev = "master";
    sha256 = "ctRx81DL5orVioB+d22qSsEe9m5+CLU7VqmRmLBN4xs=";
  };
in
  stdenv.mkDerivation {
    name = "smuggler";

    inherit src;
    runScript = "python3 ${src}/smuggler.py";

    installPhase = ''
      mkdir -p "$out/bin"
      echo "$runScript" > "$out/bin/smuggler"
      chmod +x "$out/bin/smuggler"
    '';
  }