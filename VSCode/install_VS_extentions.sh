#!/bin/sh

for i in Gruntfuggly.todo-tree mhutchie.git-graph ms-python.python ms-vscode.cpptools mtayllan.moonokai ocamllabs.ocaml-platform vscodevim.vim
do
	code --install-extension $i
done