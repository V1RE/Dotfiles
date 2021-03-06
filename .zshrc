# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle z
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle lukechilds/zsh-nvm
antigen bundle jeffreytse/zsh-vi-mode

# Load the theme
antigen theme romkatv/powerlevel10k

# Tell antigen that you're done
antigen apply

alias ls="lsd"
alias la="lsd -a"
alias tree="lsd --tree"
alias falias="alias | grep"
alias ql='qlmanage -p "$@" >/dev/null 2>&1'
alias cbts='cd $(git rev-parse --show-toplevel)/build/themes/socialbrothers'
alias cbs='cd $(git rev-parse --show-toplevel)/system'
alias sb='cd ~/Code/Socialbrothers'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias configlg='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lg='lazygit'
alias cbr='cd $(git rev-parse --show-toplevel)'
alias cba='cd $(git rev-parse --show-toplevel)/app/public/wp-content/themes/socialbrothers'
# alias ta='tmux -CC attach -t'
# alias ts='tmux -CC new-session -s'
alias vim='nvim -u ~/.config/nvim/init.vim.old'
alias v='nvim'

export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nielsmentink/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nielsmentink/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nielsmentink/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nielsmentink/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
