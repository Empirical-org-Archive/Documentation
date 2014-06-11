# Install Issues

-1 Insufficent Root Permissions
db:migrate requires root privileges. and my rot environment is completely different. no gems, no rake, no bundle.


-2 Postgres Database
ok, so "postgresql-contrib" is a necessary package to get postgresql's extensions?

-3 Owner Issue
git submodule init && git submodule update

-4 Issue with HStore

> ActiveRecord::StatementInvalid: 

> PG::InsufficientPrivilege: ERROR: permission denied to create extension "hstore"

> HINT: Must be superuser to create this extension.

> : CREATE EXTENSION IF NOT EXISTS hstore

-5 error when migrating 

> the scheme postgres does not accept registry part: super:4Rh0izHYfmfWx9cV@:   

> terminal output:rake aborted! StandardError: An error has occurred, this and all later migrations canceled:

> the scheme postgres does not accept registry part: super:4Rh0izHYfmfWx9cV@: (or bad hostname?)/Users/jasonlo/Documents/DBC/side_projects/Compass/db/migrate/20140522033151_add_queue_classic.rb:5:in `up'
> Tasks: TOP => db:migrate
(See full trace by running task with --trace)

database.yml: 
development:
host: localhost
adapter: postgresql
encoding: unicode
database: Compass-dev
pool: 5

> This apparently was caused because postgres superuser in database.yml was needed.


-6 User from "error when migrating" issue then got:

> pg_dump: [archiver (db)] connection to database "quill" failed: FATAL: password authentication failed for user "shubham"


-7 When user from "error when migrating" finally got the app running, it still didn't work that well because

> db:seed fails with oMethodError: undefined methodcost' for BCrypt::Engine:Class`

-8 User reported: "Some points of installation."
- using postgres as superuser is necessary for hstore to run
- Had to modify pg_hba.conf to use "trust" in place of md5
- Had to run db:migrate as a postgres (super) user with sudo su - postgres
- Had to export two environment variables with bash.

-9 Error when seeding:

> NameError: uninitialized constant Chapter

from line 38 in the seeds.rb

-10 With all dependencies installed; when running ./launch.sh, on OSX 10.8.5 with a couple other ports running for a couple of django projects. User got this error:

> connect: multipart: use parser (multiparty, busboy, formidable) directly
> connect: limit: Restrict request size at location of read

In the terminal user was getting

> wantsAsync [ id: 'wantsAsync' ] [ id: 'wantsAsync' ]
Listening on port undefined

he was able to get it running on http://localhost:3000/?playerID=f91161b2a6

> with PORT=3000 ./launch.sh 
however, still got the connect: multipart: use parser (multiparty, busboy, formidable) directly
connect: limit: Restrict request size at location of read error

-11 When using rake db:seed, users are reporting

> NoMethodError: undefined method 'code' for nil:NilClass
