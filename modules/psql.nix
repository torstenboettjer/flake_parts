{ config,pkgs,...}: {

devShell.packages = [ pkgs.postgresql ];
devShell.env.PGDATA = "./.pgdata";

devShell.shellHook = ''
# Use the variable defined above.
echo "Using PGDATA from module: $PGDATA"

# Check if the database has been initialized.
if [ ! -d "$PGDATA" ]; then
  echo "Initializing PostgreSQL database in '$PGDATA'..."
  ${pkgs.postgresql}/bin/initdb -D "$PGDATA"
fi

# Start the PostgreSQL server. The -l flag logs output to a file.
echo "Starting PostgreSQL server..."
${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" -l "$PGDATA/server.log" start

# Print a message to the user about how to connect.
echo "PostgreSQL server is running on localhost:5432."
echo "You can connect using 'psql -U $(whoami) postgres'."

'';

devShell.exitHook = ''
echo "Stopping PostgreSQL server..."
${pkgs.postgresql}/bin/pg_ctl -D "$PGDATA" stop || true
'';
}
