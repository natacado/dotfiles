fenv source ~/.profile

function fish_title
    true
end

if test -n "$EMACS"
    set -x TERM eterm-color
end

direnv hook fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x EDITOR vim
    alias ls eza
    abbr eza 'eza -halg@ --group-directories-first --git'
    abbr lsl 'eza -halg@ --group-directories-first --git'
    alias fd fdfind
    atuin init fish | source
    zoxide init fish | source
    alias lzd 'podman run --rm -it -v /run/user/1000/podman/podman.sock:/var/run/docker.sock -v $HOME/.config/lazydocker:/.config/jesseduffield/lazydocker docker.io/lazyteam/lazydocker'

    abbr df 'df -H'
    abbr du 'du -ch'
    abbr s 'systemctl'
    abbr suser 'systemctl --user'
    abbr e {$EDITOR}
    abbr randcommit 'git commit -m (curl -s whatthecommit.com/index.txt)'

    abbr cp 'cp -i'
    abbr rsync 'rsync -Pa --progress'
    abbr ln 'ln -i'
    abbr lns 'ln -si'
    abbr mv 'mv -i'
    abbr rm 'rm -Iv'
    abbr rmd 'rm --preserve-root -Irv'
    abbr rmdf 'rm --preserve-root -Irfv'
    abbr rmf 'rm --preserve-root -Ifv'
    abbr chgrp 'chgrp --preserve-root -v'
    abbr chmod 'chmod --preserve-root -v'
    abbr chown 'chown --preserve-root -v'
    abbr please 'sudo'
    abbr top 'btop'
    abbr hist 'history'

    abbr flac '~/bin/yt-dlp -x --audio-format flac --audio-quality 0 -o "~/Music/%(uploader)s/%(title)s.%(ext)s"'


    abbr dc 'podman-compose'
    abbr dcb 'podman-compose build'
    abbr dcd 'podman-compose down'
    abbr dcl 'podman-compose logs'
    abbr dclf 'podman-compose logs -f'
    abbr dcp 'podman-compose pull'
    abbr dcr 'podman-compose run --rm'
    abbr dcu 'podman-compose up'
    abbr dcub 'podman-compose up --build'
    abbr dcud 'podman-compose up -d'
    abbr dcudb 'podman-compose up -d --build'

    if type -q tmux
        if not test -n "$TMUX"
            tmux attach-session -t default; or tmux new-session -s default
        end
    end
end

set -x UID $(id -u)
set -x GID $(id -g)

# pnpm
set -gx PNPM_HOME "/home/paradise/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
