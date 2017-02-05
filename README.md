# climagix

A simple docker container I use for experimental stuff. When you start the container it will by default run an interactive shell. Some basic CLI tools are installed, for example:

* less
* vim
* weechat
* emacs
* mc
* links2
* wget
* python3
* python3-pip
* screen
* sudo
* git
* wget
* curl

Via pip, the following is also installed:

* awscli - The command line utilities for Amazon AWS
* boto3 - A Python library for working with AWS

You can obviously add you own to the `Dockerfile` and build it.

WARNING: This is a rather big image (>1.1GiB), but it does give you a very good CLI container to work in that is isolated from your normal working environment. 

# Building the image

Use a standard Docker command like this:

	$ docker build -t climagix .

On the standard configuration from this repo, the build is rather large! Last I check, it was north of 900MiB.

# Running

Simple enough:

	$ ./run_climagix.sh

The script will create a "home" directory in `$HOME/.climagix` and mount the container user home directory on this directory (as you can see from the script). This is nice to persist your bash history etc.

# Tips

I use the following in my `$HOME/.climagix/.bash_profile`:

	alias ls='/bin/ls -lahrt --color'
	
	export PATH=$PATH:$HOME/opt/bin
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
	
	# Generated with http://bashrcgenerator.com
	export PS1="[climagix] \[\033[38;5;160m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

I use this container to force an isolated environment especially when I do stuff online and work on Amazon AWS. Since containers are generally throw away, the security can be enforced by setting the relevant AWS environment variables only once inside the containiner. I feel this minimizes the risks. Also, when you need to use IRC, running in a container should be a lot safer.
