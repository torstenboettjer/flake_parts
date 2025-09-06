# modules/psql.nix
{
  perSystem = { pkgs, ... }: {
    packages.nodejs = pkgs.postgresql;
  };
}
