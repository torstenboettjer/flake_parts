# modules/nodejs-packages.nix
{
  perSystem = { pkgs, ... }: {
    packages.nodejs = pkgs.nodejs_21;
  };
}
