# Dotfiles Repo
## Contains files for zsh, nano and Fastfetch config

- ### .zshr: Contains esssential config for zsh shell
    * Displays Fastfetch on launch of terminal
    * Uses Frieren.txt for Fastfetch ASCII art
    * Uses fastfetch.jsonc for the layout of information shown
    * Sets zsh theme to powerlevel10k
    * Oh-My-ZSH update mode set to auto
    * Oh-My-ZSH update frequency set to once a day

- ## Aliases
    * cat="bat"
    * ls="lsd --group-directories-first -a --color always"
    * dnfi="sudo dnf install "
    * dnfu="sudo dnf upgrade"
    * dnfa="sudo dnf autoremove"
    * dnfc="dnf check-upgrade"
    * dnfs="dnf search "
    * yta-aac='yt-dlp --extract-audio --audio-format aac '
    * yta-best='yt-dlp --extract-audio --audio-format best '
    * yta-flac='yt-dlp --extract-audio --audio-format flac '
    * yta-mp3='yt-dlp --extract-audio --audio-format mp3 '
    * ytv-best='yt-dlp -f '\''bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio'\'' --merge-output-format mkv '

- ## Functions
    * alias mkdir='f() { mkdir $1 && cd $1 };f'
    * ytm()

```zsh
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
```

- ## nano
    * Syntax Highlighting for most common file types
