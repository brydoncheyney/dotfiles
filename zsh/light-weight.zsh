#keys
bindkey '^[[Z' reverse-menu-complete

#completion
setopt always_to_end
setopt auto_list
setopt auto_param_slash
setopt complete_in_word
setopt list_packed
setopt menu_complete

#history
setopt append_history
setopt bang_hist
setopt append_history
setopt share_history

#i/o
setopt correct_all
setopt prompt_subst

#dir nav
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups

autoload -U compinit
compinit

autoload -U colors
colors
