# insert binds
bind -M insert \cl 'clear; commandline -f repaint'
bind -M insert \co "accept-autosuggestion"
bind -M insert \cn "commandline -f accept-autosuggestion execute"
bind -M insert \cu 'up-or-search'
bind -M insert \ce 'down-or-search'
bind -M default n 'backward-char'
bind -M default i 'forward-char'
bind -M default N 'backward-word'
bind -M default I 'forward-word'

# visual binds
bind -M visual n 'backward-char'
bind -M visual i 'forward-char'
bind -M visual N 'backward-word'
bind -M visual I 'forward-word'

# use vi binds
fish_vi_key_bindings

# start x at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end

# wal colors
source ~/.cache/wal/colors.fish
