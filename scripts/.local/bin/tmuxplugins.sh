#!/bin/bash

# tmux plugin manager
if [ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ]; then 
    git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"
fi;
