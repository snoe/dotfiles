#echo "bashrc"

export JAVA_HOME=$(/usr/libexec/java_home)
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/case/Library/Python/3.6/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1

export GOPATH=~/.gopath
export GOBIN=~/.gopath
export LESS='-XFr'
export EDITOR=nvim
export NEOVIM_JS_DEBUG=/Users/case/nvimdebug.log

for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -e $HOME/.homesick/repos/homeshick/homeshick.sh ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi

export PROMPT_COMMAND="history -a ~/.bash_history.global"
alias shares='cd ~/dev/shares && . ~/.shares  && . Envfile'
alias lsp='cd ~/dev/lsp'
alias idc='cd ~/dev/idc'

alias em="emacsclient"
homeshick --quiet refresh

export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib:$LD_LIBRARY_PATH
#. /Users/case/torch/install/bin/torch-activate
eval `ssh-agent -s && ssh-add ~/.ssh/id_rsa`

export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src

[ -s "/Users/case/.scm_breeze/scm_breeze.sh" ] && source "/Users/case/.scm_breeze/scm_breeze.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
bind -x '"\C-r": "~/.swap_history_reverse.sh"'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
. "$HOME/.cargo/env"
