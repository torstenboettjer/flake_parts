# modules/psql.nix
{
  perSystem = { pkgs, ... }: {
    packages.psql = pkgs.postgresql;
  };
}
