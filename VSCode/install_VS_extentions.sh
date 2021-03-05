#!/bin/sh

for i in Gruntfuggly.todo-tree mhutchie.git-graph ms-python.python ocamllabs.ocaml-platform vscodevim.vim
do
	code --install-extension $i
done