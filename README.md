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
    * ytmusic()

```zsh
ytmusic () {
    SEARCH_QUERY="$*"
    mpv --no-audio-display --no-video --ytdl-raw-options=extract-audio= "ytdl://https://music.youtube.com/search?q=$SEARCH_QUERY"
}
```

- ## nano
    * Syntax Highlighting for most common file types