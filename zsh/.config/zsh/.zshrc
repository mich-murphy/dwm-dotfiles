# Start i3
if [ "$(tty)" = "/dev/tty1" ];
then
   # pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
   exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

source "$XDG_CONFIG_HOME/zsh/aliases"

# Vim keybindings for menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history 
bindkey -M menuselect 'l' vi-forward-char 
bindkey -M menuselect 'j' vi-down-line-or-history 
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' clear-screen

autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source $XDG_CONFIG_HOME/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)

# Fzf tmuxp sessions
source $XDG_CONFIG_HOME/zsh/external/scripts.sh

# Starship prompt
eval "$(starship init zsh)"

# Push the current directory visited onto the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Vim keys
bindkey -v
export KEYTIMEOUT=1

# Edit cursor appearance
autoload -Uz cursor_mode && cursor_mode

# Enable editing command linein neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Back directory shortcut
source $XDG_CONFIG_HOME/zsh/external/bd.zsh

# Configure fuzzy matching fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

export FZF_DEFAULT_OPTS='
--color=fg:#f7f1ff,bg:#222222,hl:#948ae3 
--color=fg+:#f7f1ff,bg+:#222222,hl+:#948ae3 
--color=info:#deb974,prompt:#fce566,pointer:#948ae3
--color=marker:#948ae3,spinner:#fce566,header:#fc618d'

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$XDG_CONFIG_HOME/home/mm/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/node_modules/.bin
export PATH=$PATH:$XDG_CONFIG_HOME/home/mm/.local/share/gem/ruby/3.0.0/bin

pfetch
