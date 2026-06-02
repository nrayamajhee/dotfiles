export PATH="$HOME/.local/bin:$PATH"
export PATH=/Users/nishan/.opencode/bin:$PATH
alias ta="tmux new-session -A -s $HOST"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(starship init zsh)"
