# Database Design 

*This document outlines how our database is constructed for Stories with Friends (SWF).*

## Ideas About Database

I would lean towards using Postgres because it is a solid database and there is use of it already in Quill, https://github.com/search?l=&q=postgres+user%3Aempirical-org&ref=advsearch&type=Code .

With Postgres 9.4, JSON support is better than ever. Complete with indexing and functions. http://www.postgresql.org/about/news/1522/ http://www.postgresql.org/docs/9.4/static/datatype-json.html

I've recently gathered some thoughts about node and postgres here, http://www.wlaurance.com/2014/04/Using-PostgreSQL-and-Node/ caution examples are in coffee script ;) Here I talk about a migration tool, the actual node-pg library, and the module to generate sql from JavaScript.

We could using an existing Postgres server and create a new database for stories-with-friends or run a separate server. If we want to utilize the new JSONB features, we will need a 9.4 server.

Once we have a database, create a table with the either the JSON type or for now just use a text type and JSON.parse and JSON.stringify to deserialize/serialize.

We can build model code with https://github.com/brianc/node-sql which will generate SQL statements.

I would like to take the time to properly use a db-migration tool and establish a nice pattern for the model code so someone else can easily extend things.

Since Postgres is already used in the Quill ecosystem, I see no reason to through another datastore in the mix. Postgres has one of the cleanest code bases around and is very solid.
