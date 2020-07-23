#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
alias ls='lsd'
alias cat='bat -p'
alias edit='nvim'
alias rm='trash'
if [ -z "$TMUX" ] && [ ${UID} != 0 ]
then
    tmux new-session -A -s main
fi
eval "$(starship init bash)"
