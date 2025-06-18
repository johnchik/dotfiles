# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="funky"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
antigen bundle zsh-users/zsh-completions

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export TERM=xterm

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init - zsh)"

fpath=($HOME/.zsh/completions $fpath)

#autoload -U compinit; compinit

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#autoload -U bashcompinit
#bashcompinit

# --- 3. Source the pyenv Bash Completion Script ---
# IMPORTANT: Replace the path below with the one you found in Step 1
#if [ -f /usr/share/bash-completion/completions/pyenv ]; then
#  source /usr/share/bash-completion/completions/pyenv
#fi

#bindkey '^?' backward-delete-char

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/johnchik/google-cloud-sdk/path.zsh.inc' ]; then . '/home/johnchik/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/johnchik/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/johnchik/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U compinit; compinit

# 2. Enable Zsh's Bash compatibility layer
autoload -U bashcompinit
bashcompinit

# 3. Source the system's pyenv Bash completion script
# (This is the one that correctly completes "activate")
if [ -f /usr/share/bash-completion/completions/pyenv ]; then
  source /usr/share/bash-completion/completions/pyenv
fi

# 4. Source your plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# 5. CRITICAL FIX: Tell zsh-autocomplete to use a simpler method for pyenv
# This avoids the UI bug that was causing the "Usage:" errors.
zstyle ':autocomplete:pyenv:*' widget-style 'menu-complete'

# 6. Custom keybindings
bindkey '^?' backward-delete-char

