#!/bin/bash

if [ ! -d ".git/hooks" ]; then
	mkdir -p .git/hooks
fi
if [ ! -L ".git/hooks/pre-commit" ]; then
	echo "Adding project file sorting to Git hooks"
	rm -fr .git/hooks/pre-commit
	ln -s ../../Support/sort-project-files.sh .git/hooks/pre-commit
	chmod 555 .git/hooks/pre-commit
fi
