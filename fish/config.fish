set PATH $PATH /home/fraco/.cargo/bin
set PATH $PATH /home/fraco/.local/share/gem/ruby/3.0.0/bin
set PATH $PATH /home/fraco/.local/bin
set -x EDITOR nvim


if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting 
    fortune -s
    
    zoxide init fish | source
    starship init fish | source

    alias cd="z"
end


