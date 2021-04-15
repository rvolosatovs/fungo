{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go_2-dev

    (
      pkgs.writeShellScriptBin "watch" ''
        set -e
        ${pkgs.fd}/bin/fd --glob '*.go2' . | ${pkgs.entr}/bin/entr -rs '${pkgs.gnumake}/bin/make -B translate test'
    ''
    )
  ];
}
