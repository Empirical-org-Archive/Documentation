# Development Environment using Docker

__High Level Overview:__ Docker is a linux container that contains our entire development environment. 


## Prerequisites

* Install Vagrant

  https://docs.vagrantup.com/v2/installation/

* Install VirtualBox 

  https://www.virtualbox.org/wiki/Downloads

* Install Fig
  
  http://orchardup.github.io/fig/install.html

## Setup Fig
~~~ sh
docker-osx shell
docker import https://s3.amazonaws.com/compass-files/compass.tar compass_base
docker import https://s3.amazonaws.com/compass-files/compass_api.tar compass_api_base
docker import https://s3.amazonaws.com/compass-files/quill.tar quill_base
~~~

Confirm they are installed with `docker images`

## Download Compass
~~~ sh
git clone https://github.com/empirical-org/Compass-Module-Environment.git
cd Compass-Module-Environment
git submodule init && git submodule update && cd Compass && git submodule init && git submodule update && cd ../Compass-API && git submodule init && git submodule update && cd ..
fig up
~~~

Open a new tab and run `docker-osx shell`
~~~ sh
cd Compass-Module-Environment/
fig run compass rake db:migrate db:seed
fig run quill rake db:migrate db:seed
# (restart fig)
~~~
