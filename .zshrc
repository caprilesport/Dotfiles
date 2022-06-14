#!/usr/bin/env bash

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
export ZSH="/home/vinicp/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" 
HIST_STAMPS="dd/mm/yyyy"  

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

#Plugins
plugins=(
  git 
  golang
  npm
  poetry
  rust
  zsh-syntax-highlighting 
  zsh-autosuggestions
  zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh

# aliases and enviroment variables
source ~/.alias
source ~/.env

# powerlevel10k theme, to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

