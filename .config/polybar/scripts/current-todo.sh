#!/bin/bash

TODO_SH="/home/cody/Scripts/todo/todo.sh"
TASK=$(sh $TODO_SH -p lsp a | head -n 1 | sed "s/[\@].*$//g")

if ! [[ $TASK == '--' ]]; then
    echo " $TASK"
fi
