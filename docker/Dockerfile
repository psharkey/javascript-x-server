#
# WIP - non-functional
#
# Build (from base of repo): docker build -t javascript-x-server docker
#
# docker run --rm -it --name test -p 3000:3000 --volumes-from github --workdir=$(pwd) javascript-x-server bash
#
# Then, within this shell...
# npm install
# gulp 
# npm start
#
# Then open http:/192.168.99.1:3000 in Chrome
#
FROM ubuntu:trusty

# Install dependencies (see Vagrantfile)
RUN apt-get update -qq && apt-get install -qqy \
	curl \
	libnotify-bin \
	x11-apps \
	x11-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

# Install Node.js v5 via package manager and gulp
# (https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -qqy nodejs \ 
	&& npm install --global gulp-cli \
	&& npm install --save-dev gulp
