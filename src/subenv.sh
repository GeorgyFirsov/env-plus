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
	echo "Wrong number of arguments. Usage: subenv <environment>" >&2
	return 1
fi

if [[ $PYTHONPATH != *$ENVS/$1/lib/python*/site-packages* ]]; then
	echo "Environment '$1' is not added" >&2

	#
	# Not an error actually
	#
	return
fi

export PYTHONPATH=$(echo $PYTHONPATH | sed -e "s|$ENVS/$1/lib/python[^:/]*/site-packages:||")

echo "Environment '$1' was succesfully detached from the current one" >&1

