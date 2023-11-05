{ lib, fetchurl, jdk, buildFHSEnv, unzip, makeDesktopItem, stdenv, pkgs }:
let
  version = "2023.10.2.4";

  src = fetchurl {
    name = "burpsuite.jar";
    urls = [
      "https://portswigger.net/burp/releases/download?productId=100&version=${version}&type=Jar"
      "https://web.archive.org/web/https://portswigger.net/burp/releases/download?productId=100&version=${version}&type=Jar"
    ];
    sha256 = "en+eay+XL09Vk6H011fYvxGluMAndedtqCo4dQZvbBM=";
  };

in
stdenv.mkDerivation {
  name = "burpsuite-${version}";
  inherit src;

  runScript = "${jdk}/bin/java -jar ${src}";

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p "$out/bin"
    echo "$runScript" > "$out/bin/burpsuite"
    chmod +x "$out/bin/burpsuite"
    mkdir -p "$out/share/pixmaps"
    ${lib.getBin unzip}/bin/unzip -p ${src} resources/Media/icon64community.png > "$out/share/pixmaps/burpsuite.png"
  '';

}