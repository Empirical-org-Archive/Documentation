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

## Download Compass

~~~ sh
git clone https://github.com/empirical-org/Compass-Module-Environment.git
cd Compass-Module-Environment
git submodule init && git submodule update && cd Compass && git submodule init && git submodule update && cd ../Compass-API && git submodule init && git submodule update && cd ..
docker-osx shell # wait for VM to boot
fig up
~~~

Open a new tab and run `docker-osx shell`

~~~ sh
cd Compass-Module-Environment/
fig run compass rake db:migrate db:seed
fig run quill rake db:migrate db:seed
~~~

Return to the previous tab and restart fig:

~~~ sh
^C # wait for fig to exit
find . -name server.pid -delete
fig up
~~~

Run `http://localdocker:3000/`

## Finished! Next steps

Read the [Contributing Guide](/Getting-Started/Contributing.md) for guidelines on how to contribute your changes.
