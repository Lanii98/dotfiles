neofetch | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# need to install powerlevel10k for oh-my-zsh from 
# ``git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k``
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable automatic OMZ uppdates + Check for updates once a day
zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 1

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	zsh-syntax-highlighting
	python
	adb
	colored-man-pages
	colorize
	command-not-found
	dnf
	git-prompt
	git
	history
)

# cd into newly made directory
mkcd(){ mkdir "$1" && cd "$1"; }

function ashare() {
	cd /home/lana/Applications && ./AudioShare -b 192.168.15.177
}

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(zoxide init --cmd cd zsh)"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

