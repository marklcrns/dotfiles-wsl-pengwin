#!/bin/bash

# Usage: Update vim-tmux-navigator config in .tmux.conf with:
# is_vim="vim-tmux-navigator-pipenv-workaround.sh #{pane_tty}" 

pane_tty=$1
pipenv_pid=$(pgrep -t ${pane_tty/\/dev\/} pipenv)
if [[ $? == 0 ]]; then
  ps -o state=,comm= -p $(pstree -p $pipenv_pid | grep -Po '\(\d+\)' | tr -d '()')
else
  ps -o state=,comm= -t $pane_tty
fi | grep -qP '^[^TXZ] (view|n?vim?x?)$'
