set PATH $PATH /home/fraco/.cargo/bin
set PATH $PATH /home/fraco/.local/share/gem/ruby/3.0.0/bin
set PATH $PATH /home/fraco/.local/bin
set PATH $PATH /opt/cuda/bin
set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket


if status is-interactive
    # Comandos a ejecutar en sesiones interactivas
    set fish_greeting

    # Comprobamos si estamos en la terminal Kiro
    if string match -q "$TERM_PROGRAM" "kiro"
        # 1. Si estamos en Kiro, le decimos que se identifique como "vscode"
        #    para que su propio script de integración funcione.
        set -gx TERM_PROGRAM "vscode"

        # 2. Inmediatamente después, cargamos el script de integración.
        #    Ahora la comprobación interna del script ("string match ... 'vscode'") tendrá éxito.
        . (kiro --locate-shell-integration-path fish)
    else
        # Si NO estamos en Kiro, cargamos zoxide, starship y los alias como de costumbre.
        zoxide init fish | source
        starship init fish | source

        alias cd="z"
    end
end

# pnpm
set -gx PNPM_HOME "/home/fraco/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
