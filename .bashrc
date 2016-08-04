source ~/.aliases

# puts current dir in iterm2 tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

#quickly edit bash profile and bashrc
alias editprofile="vim ~/.bash_profile"
alias editrc="vim ~/.bashrc"
alias viewprofile="less ~/.bash_profile"
alias viewrc="less ~/.bashrc"

# for <c-s> save in vim
stty -ixon
