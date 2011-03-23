# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

export EDITOR=vim
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# enable colors
autoload -U colors && colors

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# gentoo prompt theme
prompt_gentoo_help () {
  cat <<'EOF'
This prompt is color-scheme-able.  You can invoke it thus:

  prompt gentoo [<promptcolor> [<usercolor> [<rootcolor>]]]

EOF
}

prompt_gentoo_setup () {
  prompt_gentoo_prompt=${1:-'blue'}
  prompt_gentoo_user=${2:-'green'}
  prompt_gentoo_root=${3:-'red'}

  if [ "$USER" = 'root' ]
  then
    base_prompt="%{$fg_bold[$prompt_gentoo_root]%}%m%{$reset_color%} "
  else
    base_prompt="%{$fg_bold[$prompt_gentoo_user]%}%n@%m%{$reset_color%} "
  fi
  post_prompt="%{$reset_color%}"

  local color="%{*}"
  base_prompt_no_color="${(S)base_prompt//${~color}/}"
  post_prompt_no_color="${(S)post_prompt//${~color}/}"

  setopt noxtrace localoptions
  local base_prompt_expanded_no_color base_prompt_etc
  local prompt_length space_left

  base_prompt_expanded_no_color=$(print -P "$base_prompt_no_color")
  base_prompt_etc=$(print -P "$base_prompt%(4~|...|)%3~")
  prompt_length=${#base_prompt_etc}
  path_prompt="%{$fg_bold[$prompt_gentoo_prompt]%}%1~"
  PS1="$base_prompt$path_prompt %# $post_prompt"
  PS2="$base_prompt$path_prompt %_> $post_prompt"
  PS3="$base_prompt$path_prompt ?# $post_prompt"

  precmd  () { }
  preexec () { }
}

prompt_gentoo_setup "$@"
