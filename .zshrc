fastfetch -l "${HOME}/Documents/teto.txt" -c "${HOME}/Documents/fastfetch.jsonc"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias cat="bat"
alias ls="lsd --group-directories-first -a --color always"

alias yta-aac='yt-dlp --extract-audio --audio-format aac '
alias yta-best='yt-dlp --extract-audio --audio-format best '
alias yta-flac='yt-dlp --extract-audio --audio-format flac '
alias yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
alias ytv-best='yt-dlp -f '\''bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio'\'' --merge-output-format mkv '
alias ytv-best-sub='yt-dlp -f '\''bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio'\'' --merge-output-format mkv --write-subs --sub-langs "en.*" --embed-subs '

alias dnfi="sudo dnf install "
alias dnfu="sudo dnf upgrade --refresh"
alias dnfa="sudo dnf autoremove"
alias dnfc="dnf check-upgrade"
alias dnfs="dnf search "
alias dnfr="sudo dnf remove "

alias rms='rm $HOME/Pictures/Screenshots/Screenshot*'

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
