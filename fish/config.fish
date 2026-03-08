# Set aliases
alias vi "nvim"
alias ls "eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions"
alias cat "bat"
alias rg "rg --color=always"

# Add to PATH
set -gx PATH $PATH /home/nix/.local/bin
# Bind fzf completions to ctrl-x
# zoxide init (Fish version)
zoxide init fish --cmd cd | source
fzf --fish | source
# Set editor
set -gx EDITOR nvim
set -gx VISUAL nvim
# History config

function fish_greeting
  #    cowsay "Hi"

end

# fzf config
fzf --fish | source

set -gx fzf_ctrl_t_opts "--preview='bat -n --color=always --line-range :500 {}'"
set -gx fzf_alt_c_opts "--preview='eza --tree --color=always {} | head -200'"


# Advanced fzf completion previews
function _fzf_comprun
    set command $argv[1]
    set argv $argv[2..-1]

    switch $command
        case cd
            fzf --preview 'eza --tree --color=always {} | head -200' $argv
        case export unset
            fzf --preview "eval 'echo \$'{}" $argv
        case ssh
            fzf --preview 'dig {}' $argv
        case '*'
            fzf --preview 'bat -n --color=always --line-range :500 {}' $argv
    end
end

# Yazi integration (ported)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (cat $tmp)
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd "$cwd"
    end
    rm -f "$tmp"
end

# Set bat theme
set -gx BAT_THEME tokyonight_night



# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
