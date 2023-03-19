#!/bin/zsh

if [[ $# -ne 1 ]]; then 
	echo "Wrong number of arguments. Usage: rmenv <environment>" >&2
	return 1
fi

if [ ! -d $ENVS/$1 ]; then
	echo "Environment '$1' doesn't exist" >&2
	return 1
fi

rm -rf $ENVS/$1

echo "Environment '$1' was successfully removed" >&1
