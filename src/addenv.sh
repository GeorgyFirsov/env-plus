#!/bin/zsh

if [ "${BASH_SOURCE-}" = "$0" ]; then
	echo "You must source this script: \$ source $0" >&2
	return 1
fi

if [[ "$VIRTUAL_ENV" == "" ]]; then
	echo "Not in virtual environment" >&2
	return 1
fi

if [[ $# -ne 1 ]]; then
	echo "Wrong number of arguments. Usage: addenv <environment>" >&2
	return 1
fi

if [ ! -d $ENVS/$1 ]; then
	echo "Environment '$1' doesn't exist" >&2
	return 1
fi

if [[ "$ENVS/$1" == "$VIRTUAL_ENV" ]]; then
	echo "Trying to add environment to itself" >&2
	
	#
	# Not an error by the way
	#
	return
fi

if [[ $PYTHONPATH == *$ENVS/$1/lib/python*/site-packages* ]]; then
	echo "Environment '$1' is already added"
	
	#
	# Not an error too
	#
	return 
fi

export PYTHONPATH=$(find $ENVS -type d -regex "$ENVS/$1/lib/python[^:/]*/site-packages$"):$PYTHONPATH

echo "Environment '$1' was successfully attached to the current one"

