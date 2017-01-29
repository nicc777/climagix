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

You can obviously add you own to the `Dockerfile` and build it.

# Building the image

Use a standard Docker command like this:

	$ docker build -t climagix .

On the standard configuration from this repo, the build is rather large! Last I check, it was north of 900MiB.

# Running

Simple enough:

	$ ./run_climagix.sh

The script will create a "home" directory in `$HOME/.climagix` and mount the container user home directory on this directory (as you can see from the script). This is nice to persist your bash history etc.
