# Install Issues

1. Insufficent Root Permissions
db:migrate requires root privileges. and my rot environment is completely different. no gems, no rake, no bundle.


2. Postgres Database
ok, so "postgresql-contrib" is a necessary package to get postgresql's extensions?

3. Owner Issue
git submodule init && git submodule update

4. Issue with HStore

> ActiveRecord::StatementInvalid: 

> PG::InsufficientPrivilege: ERROR: permission denied to create extension "hstore"

> HINT: Must be superuser to create this extension.

> : CREATE EXTENSION IF NOT EXISTS hstore