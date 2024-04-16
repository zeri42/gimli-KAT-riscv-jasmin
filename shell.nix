{pkgs?import<nixpkgs>{}}:
let
  pkgscross = import <nixpkgs> {
    crossSystem = (import <nixpkgs/lib>).systems.examples.riscv32-embedded;
  };
in pkgs.mkShell {
	buildInputs = with pkgs; [
		pkgscross.stdenv.cc
		gdb 
		qemu 
		gnumake
	];
}
