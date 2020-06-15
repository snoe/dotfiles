[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[ -s "/Users/case/.scm_breeze/scm_breeze.sh" ] && source "/Users/case/.scm_breeze/scm_breeze.sh"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
eval "$(jenv init -)"
