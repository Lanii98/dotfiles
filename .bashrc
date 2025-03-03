# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Search YT Music and play the first result
ytm() {

    # Define colors using ANSI escape sequences
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;36m'
    RED_BOLD='\033[1;31m'
    RESET='\033[0m'

    printf "${CYAN_BOLD}Search Youtube Music..: ${RESET}" >&2
    read input

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
