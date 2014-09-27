
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[ -s "/Users/snoe/.scm_breeze/scm_breeze.sh" ] && source "/Users/snoe/.scm_breeze/scm_breeze.sh"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
homeshick --quiet refresh