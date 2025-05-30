# oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/slo.yml)"
fi

# personal shell settings
export EDITOR=nano
export VISUAL="$EDITOR"
alias home="cd ~"

# git
alias g=git
alias ga='git add'
alias gc='git commit'
alias gp='git pull'
alias gt='git tag'
alias gs='git status'

# terraform
alias tf=terraform

# kubernetes
export KUBECONFIG=~/.kube/kubeconfig
alias k=kubectl
alias kn='kubectl config set-context --current --namespace'
alias h=helm

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
