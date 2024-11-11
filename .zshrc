export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/snap/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$XDG_CONFIG_HOME/.oh-my-zsh"

zstyle ':omz:update' mode disabled  # disable automatic updates

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git python direnv)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
function activate_venv_if_exists() {
  if [ -d ".venv" ] && [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
    echo "Virtual environment activated."
  else
    echo "No virtual environment found in the current directory."
  fi
}

# Yazi:
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias vim="nvim"
alias vi="nvim"
alias bat="batcat"

# Eza
alias l="eza -l --icons --git -a"
alias ls="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Bind Ctrl+V to the function
alias v=activate_venv_if_exists
# bindkey -s '^V' 'activate_venv_if_exists\n'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
