#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias vim='nvim'
alias spotify='spotify --force-device-scale-factor=2.0'
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias x='startx'
alias python='python2.7'
alias yaourt='yaourt --noconfirm '
alias clion='~/etc/clion-2016.1.1/bin/clion.sh'
alias opera='opera-developer -newwindow'
alias reload_bashrc='source ~/.bashrc'
alias snvim='sudo -E nvim'
alias setmykeys='xmodmap ~/.Xmodmap'
alias shit='xset dpms force off'
alias gad='git add .'
alias gc='git commit'
# alias sudo='sudo '

function ff() { find . -name '*'"$*"'*' 2>&1 | grep -v "Permission denied"; }

###-begin-yo-completion-###
if type complete &>/dev/null; then
  _yo_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           yo-complete completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _yo_completion yo
fi
###-end-yo-completion-###


PS1='\[\e[?112c\]\u:\w > '
PROMPT_COMMAND=
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	PATH+="~/etc/clion-2016.1.1/bin"
PKG_CONFIG_PATH="/usr/include/qt/QtCore"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
