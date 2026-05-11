{
  description = "Reusable GitHub Actions workflows for ojhermann-org";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.prek
            pkgs.nixfmt
            pkgs.statix
            pkgs.deadnix
            pkgs.shellcheck
          ];
          shellHook = ''
            if [ -f prek.toml ] && [ ! -f .git/hooks/pre-commit ]; then
              prek install
            fi
          '';
        };
      });
    };
}
