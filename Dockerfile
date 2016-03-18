#
# WIP - non-functional
#
# docker run --rm -it --name test -p 3000:3000 --volumes-from github --workdir=$(pwd) test bash
#
# Then, within this shell...
# npm install
# npm start
#
# Then open http:/192.168.99.1:3000 in Chrome
#
FROM ubuntu:trusty

# Install dependencies (see Vagrantfile)
RUN apt-get update -qq && apt-get install -qqy \
	blackbox \
	blackbox-themes \
	curl \
	expect \
	menu \
	wireshark \
	x11-apps \
	x11-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

# Install Node.js v5 via package manager
# (https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -qqy nodejs

COPY dist/xserver.conf /etc/init/
RUN update-menus \
	&& mkdir -p ~/.blackbox/styles
COPY dist/blackboxrc ~/.blackboxrc
COPY dist/Gray ~/.blackbox/styles/
COPY package.json ~/package.json
WORKDIR ~
RUN npm install
