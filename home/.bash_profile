[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[ -s "/Users/case/.scm_breeze/scm_breeze.sh" ] && source "/Users/case/.scm_breeze/scm_breeze.sh"
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/dev/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
eval "$(jenv init -)"
. "$HOME/.cargo/env"
