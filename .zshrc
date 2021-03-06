export PATH=~/.emacs.d/bin:$PATH

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

export PS1="%n@%M %~ %% "

source ~/.dotbare/dotbare.plugin.zsh
alias dots=~/.scripts/dotbare_auto.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/michael/.zshrc'

autoload -Uz compinit
compinit

# update my dotfiles from my github repo
dotbare pull
