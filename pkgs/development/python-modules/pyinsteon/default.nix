{ lib
, aiofiles
, aiohttp
, async_generator
, buildPythonPackage
, fetchFromGitHub
, pypubsub
, pyserial
, pyserial-asyncio
, pytest-asyncio
, pytest-timeout
, pytestCheckHook
, pythonOlder
, pyyaml
}:

buildPythonPackage rec {
  pname = "pyinsteon";
  version = "1.1.1";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-KrsZfLJRYqlV/VwMElv4YoT3/vvfJmrN47s7dGm4isw=";
  };

  propagatedBuildInputs = [
    aiofiles
    aiohttp
    pypubsub
    pyserial
    pyserial-asyncio
    pyyaml
  ];

  checkInputs = [
    async_generator
    pytest-asyncio
    pytest-timeout
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "pyinsteon"
  ];

  meta = with lib; {
    description = "Python library to support Insteon home automation projects";
    longDescription = ''
      This is a Python package to interface with an Insteon Modem. It has been
      tested to work with most USB or RS-232 serial based devices such as the
      2413U, 2412S, 2448A7 and Hub models 2242 and 2245.
    '';
    homepage = "https://github.com/pyinsteon/pyinsteon";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
