#!/bin/sh

set -e

# if command starts with an option, prepend ${CMD}
if [ "${1#-}" != "$1" ]; then
	set -- ${CMD} "$@"
fi

exec "$@"