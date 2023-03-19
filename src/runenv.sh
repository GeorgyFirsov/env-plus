#!/bin/zsh

if [ "${BASH_SOURCE-}" = "$0" ]; then
	echo "You must source this script: \$ source $0" >&2
	return 1
fi

if [ ! -d $ENVS/$1 ]; then
	echo "Environment '$1' doesn't exist" >&2
	return 1
fi

source $ENVS/$1/bin/activate
