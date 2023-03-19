#!/bin/zsh

if [[ $# -ne 1 ]]; then
	echo "Wrong number of arguments. Usage: rmenv <environment>" >&2
	return 1
fi

if [ -d $ENVS/$1 ]; then
	echo "Environment '$1' already exists" >&2
	return 1
fi

virtualenv $ENVS/$1

echo "Environment '$1' was successfully created" >&1
