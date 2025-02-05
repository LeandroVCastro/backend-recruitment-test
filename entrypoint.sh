#!/bin/bash
# Docker entrypoint script.
cd /code

# Wait until Postgres is ready
while ! pg_isready -q -h $DATABASE_HOST -p $DATABASE_PORT -U $DATABASE_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $DATABASE_DB"` ]]; then
  echo "Database $DATABASE_DB does not exist. Creating..."
  mix ecto.create
  mix ecto.migrate
  mix ecto.seed
  echo "Database $DATABASE_DB created."
fi

exec mix phx.server
