set PATH $PATH /home/fraco/.cargo/bin
set PATH $PATH /home/fraco/.local/share/gem/ruby/3.0.0/bin
set PATH $PATH /home/fraco/.local/bin
set PATH $PATH /opt/cuda/bin
set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

if test -z "$DISPLAY" ; and test "$XDG_VTNR" -eq 1
    Hyprland
end


if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting 

    zoxide init fish | source
    starship init fish | source

    alias cd="z"
end



# pnpm
set -gx PNPM_HOME "/home/fraco/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
