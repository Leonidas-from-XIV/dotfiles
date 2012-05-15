# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

export EDITOR=vim
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# change directories using directory names only
setopt auto_cd
# push directory onto stack automatically on "cd"
setopt auto_pushd
# extended globbing
setopt extended_glob
# correct misspelled commands
setopt correct
# don't truncate files with redirection >
setopt noclobber
# report background jobs status immediatly
setopt notify
# always hash $PATH before doing completion
setopt hash_list_all
# don't just complete at word end
setopt complete_in_word
# don't kill background jobs at shell exit
setopt nohup

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# write history immediatly after commands
setopt inc_append_history
# share history between shells
setopt share_history
# write timestamps and duration of commands to history
setopt extended_history
# ignore duplicates
setopt hist_ignore_all_dups hist_save_no_dups hist_find_no_dups
# ignore all commands in history if they start with a space
setopt hist_ignore_space
# strip meaningless blanks from history entries
setopt hist_reduce_blanks
# don't store history commands
setopt hist_no_store

# magically quote urls when pasting
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# no spelling correction
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
# prefix with space to exclude from history (hist_ignore_space)
alias ls=' ls'
alias cd=' cd'

# colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# internet radio
alias somafm='read "?Which station: " && mplayer -quiet -playlist http://somafm.com/startstream=${REPLY}.pls'
alias di='read "?Which station: " && mplayer -quiet -playlist http://listen.di.fm/public3/${REPLY}.pls'

# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working#Zsh
# gnome-terminal doing strange stuff
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
# the normal bindings, just for reference
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# enable searching history with globs:
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# make ^Z in shell resume last suspended process
foreground-last() {
  fg %
}
zle -N foreground-last
bindkey "^Z" foreground-last

# easy way to look up ZSH documentation
zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# more stuff? check this:
# http://chneukirchen.org/blog/archive/2008/02/10-zsh-tricks-you-may-not-know.html

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
