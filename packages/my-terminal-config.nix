{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  name = "myterminalconfig";

  src = fetchFromGitHub {
    owner = "jehna";
    repo = "my-terminal-config";
    rev = "master";
    sha256 = "PKeNKbtckpGXQA3f7333cOh0QhVJFC/36p+goAGX9rQ=";
  };

  installPhase = ''
    mkdir -p $out/.config/
    cp . $out/.config/ -r
  '';
}