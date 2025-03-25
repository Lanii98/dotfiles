fastfetch -l "${HOME}/Documents/Frieren.txt" -c "${HOME}/Documents/fastfetch.jsonc" | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# update automatically without asking + Check for updates (in days)
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases to make cat and ls function nicer
alias cat="bat"
alias ls="lsd --group-directories-first -a --color always"

# Yt-dlp
alias yta-aac='yt-dlp --extract-audio --audio-format aac '
alias yta-best='yt-dlp --extract-audio --audio-format best '
alias yta-flac='yt-dlp --extract-audio --audio-format flac '
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias ytv-best='yt-dlp -f '\''bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio'\'' --merge-output-format mkv '

# DNF aliases
alias dnfi="sudo dnf install "
alias dnfu="sudo dnf upgrade --refresh"
alias dnfa="sudo dnf autoremove"
alias dnfc="dnf check-upgrade"
alias dnfs="dnf search "
alias dnfr="sudo dnf remove "

alias rms='rm $HOME/Pictures/Screenshots/Screenshot*'

# Search YT Music and play the first result
ytm() {

    # Define color constants
    GREEN_BOLD=$'\033[1;32m'
    CYAN_BOLD=$'\033[1;36m'
    RED_BOLD=$'\033[1;31m'
    RESET=$'\033[0m'

    read "input?$CYAN_BOLD Search Youtube Music..: $RESET"

    if [ -z "$input" ]; then
        echo -e "${RED_BOLD}Error: Please provide a search query${RESET}"
        ytm
        return 1
    fi

    mpv \
        --no-video \
        --quiet \
        --ytdl-raw-options=extract-audio= \
        "ytdl://https://music.youtube.com/search?q=${input}" \
        2>/dev/null

}
