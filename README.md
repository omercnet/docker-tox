# Tox
This is an ubuntu based docker image for tox.

If you're looking to avoid pyenv or need a single image for your CI that has py2/3 and tox preinstalled, you found a solution.

Usage:

    $ docker run --rm -it -v `pwd`:/app omercnet/tox
	
Or if you're into [alpine](https://github.com/omercnet/docker-tox/tree/alpine):

    $ docker run --rm -it -v `pwd`:/app omercnet/tox:alpine

You can also use 'natively' adding this to your shell rc:

	$ alias tox='docker run --rm -it -v `pwd`:/app omercnet/tox
	$ tox --help