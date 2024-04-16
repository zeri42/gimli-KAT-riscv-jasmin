{pkgs?import<nixpkgs>{}}:
let
  pkgscross = import <nixpkgs> {
    crossSystem = (import <nixpkgs/lib>).systems.examples.riscv32-embedded;
  };
in pkgs.mkShell {
	buildInputs = [
		pkgscross.stdenv.cc
		pkgs.gdb 
		pkgs.qemu 
		pkgs.gnumake
		(pkgs.callPackage ./jasmin/default.nix {}) # this gets us the risc-v jasminc in PATH
	];
}
