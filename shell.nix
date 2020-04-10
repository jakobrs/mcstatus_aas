{ pkgs ? import <nixpkgs> {} }: with pkgs;

mkShell {
  buildInputs = [ (python3.withPackages (p: with p; [ flask waitress nur.repos.jakobrs.mcstatus ])) ];
}
