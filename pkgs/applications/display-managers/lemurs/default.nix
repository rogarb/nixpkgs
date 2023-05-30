{ lib, fetchFromGitHub, rustPlatform, linux-pam }:

rustPlatform.buildRustPackage rec {
  pname = "lemurs";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "coastalwhite";
    repo = "lemurs";
    rev = "refs/tags/v${version}"; 
    sha256 = "sha256-6mNSLEWafw8yDGnemOhEiK8FTrBC+6+PuhlbOXTGmN0="; 
  };

  buildInputs = [ linux-pam ];

  cargoSha256 = "sha256-OCaIeQB8reK0089vbC+4IvQt5pKdZ2SCyyGuQEYWzjo=";

  cargoPatches = [
    ./fix-version-number-in-cargo-lock.patch
  ];

  meta =  {
    homepage = "https://github.com/coastalwhite/lemurs";
    description = "A customizable TUI display/login manager written in Rust";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ rogarb ];
    platforms = lib.platforms.linux;
  };
}
