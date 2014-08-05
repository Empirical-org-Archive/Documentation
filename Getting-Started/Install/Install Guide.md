# Development Environment using Docker

__High Level Overview:__ Docker is a linux container that contains our entire development environment. 


## Prerequisites

* Install Vagrant

  https://docs.vagrantup.com/v2/installation/

* Install VirtualBox 

  https://www.virtualbox.org/wiki/Downloads

* Install Fig
  
  http://orchardup.github.io/fig/install.html

## Notes on Linux Distributions

If you are using a distribution of linux it is not necessary to use docker-osx. All of the commands should work exactly the same if you just skip over the docker-osx lines.

## Download Empircal Core

~~~ sh
git clone https://github.com/empirical-org/Empirical-Core-Module-Environment.git
cd Compass-Module-Environment
git submodule init && git submodule update && cd Compass && git submodule init && git submodule update && cd ../Compass-API && git submodule init && git submodule update && cd ..
docker-osx shell # wait for VM to boot
~~~

Build the development environment images. You will only have to do this once. The next time you start the environment, you can omit this command unless a new gem has been added to the project as a dependency.

~~~ sh
fig build
~~~

Start the two database containers.

~~~ sh
fig up -d compassdb quilldb
~~~

Run the database migrations.

~~~ sh
fig run compass rake db:create db:migrate db:seed
fig run quill rake db:create db:migrate db:seed
~~~

Start the rest of the application containers.

~~~ sh
fig up
~~~

Open `http://localdocker:3000/` in your web browser.

## Finished! Next steps

Read the [Contributing Guide](/Getting-Started/Contributing.md) for guidelines on how to contribute your changes.
