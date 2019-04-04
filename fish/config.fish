source ~/.aliases
source ~/.abbr.fish

fish_vi_key_bindings

# env variables
set -g -x PATH . /usr/local/bin $PATH ~/bin ~/dotfiles/bin /Users/mark/Library/Python/2.7/bin
set -g -x PYTHONPATH /Applications/Binary\ Ninja.app/Contents/Resources/python/
set -g -x fish_greeting ""
set -g -x EDITOR ~/dotfiles/e
set -g -x GOPATH ~/code/lang/go/gopath

# for vim airline
# set -g -x LC_ALL en_US.UTF8
# set -g -x LANG en_US.UTF8

eval (python -m virtualfish)
