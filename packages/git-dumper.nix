{ lib
, python3
, fetchPypi
}:
let
  pname = "git-dumper";
  version = "1.0.6";
in
  python3.pkgs.buildPythonApplication {
    inherit pname;
    inherit version;
    format = "pyproject";

    src = fetchPypi {
      inherit pname;
      inherit version;
      sha256 = "Dsj1ec6p0nFaGT3abf+mOrJgnH0gci1OQE2Roi5PfJQ=";
    };

    propagatedBuildInputs = with python3.pkgs; [
      setuptools
      urllib3
      requests
      beautifulsoup4
      dulwich
    ];
  }