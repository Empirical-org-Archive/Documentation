1.  Install Ubuntu 14.04 LTS

2.  Upgrade the system.

3.  Clone the Empricial-Core git repository.

        git clone http://github.com/empirical-org/Empirical-Core.git ./empirical-core

4.  Install rbenv

        sudo apt-get install rbenv

5.  Install the ruby-build plugin for rbenv.

        mkdir -p ~/.rbenv/plugins
        git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

6.  Checkout the most recent tag of the ruby-build plugin.

        cd ~/.rbenv/plugins/ruby-build
        git checkout v20140702

7.  Build dependencies needed to build Ruby 2.1.2.

        sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev

8.  Install Ruby 2.1.2 using rbenv.

        sudo rbenv install 2.1.2

9.  Change directories to the empirical-core checkout. Verify the local version
    of Ruby has changed to 2.1.2. Set the shell version to 2.1.2 as well.

        cd ./empirical-core
        rbenv local

        > 2.1.2

        rbenv shell 2.1.2
        rbenv shell

        > 2.1.2

10. Initialize rbenv and verify that you are now using Ruby 2.1.2.

        eval "$(rbenv init -)"
        ruby --version

        > ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-linux]

11. Install Bundler and verify you are using the rbenv version.

        sudo gem install bundler
        which bundle

        > /home/matthew/.rbenv/shims/bundle

12. Install empirical-core gem dependencies and rehash rbenv.

        sudo apt-get install libusb-1.0.0 postgresql postgresql-contrib-9.3 postgresql-server-dev-9.3
        bundle install
        rbenv rehash

13. Create the database configuration file from the given example. Create
    a user/password entry in the file (you will add this user/password pair
    into PostgreSQL in the next step).

        cp config/database.yml.example config/database.yml

    The file should look something like this when you're done with it.

        development:
            host: localhost
            adapter: postgresql
            encoding: unicode
            database: emp_gr_development
            username: my_name
            password: my_pass

14. Likewise create a .env file from the .env-sample example. 

        cp .sample-env .env

15. Start PostgreSQL and create your postgresql user. Test your login. Note
    that $USER and the password you enter should match what you put in the
    database.yml file above.

        sudo service start postgresql
        sudo -u postgres createuser --superuser $USER
        sudo -u postgres psql

        postgres=#> \password $USER
        postgres=#> Enter password: **********
        postgres=#> Enter it again: **********
        postgres=#> \q

        sudo -u postgres createdb $USER
        psql
        matthew=#> \q

16. Build the database.

        rake db:create
        rake db:migrate

17. Run the server and make sure it works.

        rails server
        curl localhost:3000
