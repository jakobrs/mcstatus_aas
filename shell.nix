{ pkgs ? import <nixpkgs> {}
, nur  ? import (fetchTarball https://github.com/nix-community/nur/archive/master.tar.gz) { inherit pkgs; }
}: with pkgs;

mkShell {
  buildInputs = [ (python3.withPackages (p: with p; [ flask waitress nur.repos.jakobrs.mcstatus ])) ];
}
