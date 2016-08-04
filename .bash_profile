export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.dotfiles/bin:$PATH"
export EDITOR="/usr/bin/vim"

### prompt stuff #########################################

# Colors
black='\[\e[0;30m\]' # Black - Regular
red='\[\e[0;31m\]' # Red
green='\[\e[0;32m\]' # Green
blue='\[\e[0;34m\]' # Blue
purple='\[\e[0;35m\]' # Purple
cyan='\[\e[0;36m\]' # Cyan
white='\[\e[0;37m\]' # White
bblack='\[\e[1;30m\]' # Black - Bold
bred='\[\e[1;31m\]' # Red
bgreen='\[\e[1;32m\]' # Green
bblue='\[\e[1;34m\]' # Blue
bpurple='\[\e[1;35m\]' # Purple
bcyan='\[\e[1;36m\]' # Cyan
bwhite='\[\e[1;37m\]' # White

reset='\[\e[0m\]'    # Text Reset

#bash prompt
#export PS1="[\h:\u//\W]{ "
#export PS1="[\w]{ "
#export PS1="\e[1;32m\][\w]{\[\e[0m\] " # [~/Desktop]{
#export PS1="\e[1;32m\][\u:\w]{\[\e[0m\] " # [mark:~/Desktop]{
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] ' # [mark@Mothership Desktop]$
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# megatron
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' 
}

#export PS1="\[$bgreen\][\u:\[$bcyan\]\w\[$bgreen\]]\[$bblue\]\$(parse_git_branch)\[$bgreen\]{ \[$reset\]"
# export PS1="$bgreen[\u:$bcyan\w$bgreen]$bblue\$(parse_git_branch)$bgreen{ $reset" # works well with hardcore
export PS1="$green\u $cyan\h $blue\W$green$bred\$(parse_git_branch)$green ❯ $reset" # works well with solarized which can't do bold
export PS2="\[$bgreen\]> \[$reset\]"

export CLICOLOR=1

#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=Gxfxcxdxbxegedabagacad

source ~/.bashrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
