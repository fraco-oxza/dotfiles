#!/usr/bin/env bash
# Barra rápida para apuntar en qué estoy trabajando (Super + T).
#
# Sin argumentos abre una barra de wofi, toma la frase y se la pasa a
# tiempo.py, que es quien sabe escribir en la bitácora. Acá no se toca el
# archivo del día: este script es solo el camino entre el teclado y ese script.
#
# Con argumentos usa esos y no abre nada. Sirve para probarlo desde una
# terminal y para colgarlo de otro bind con una frase fija.
#
# Corre desde un bind de Hyprland, donde el entorno es más pobre que en una
# shell interactiva: rutas absolutas, PATH explícito y nada que dependa del
# directorio actual.

set -uo pipefail

# Hyprland normalmente pasa HOME y un PATH usable, pero «normalmente» no es
# «siempre», y un bind que falla en silencio es peor que uno que no existe.
: "${HOME:=$(getent passwd "$(id -u)" | cut -d: -f6)}"
export PATH="/usr/local/bin:/usr/bin:/bin:${PATH:-}"
cd / 2>/dev/null || true

readonly TIEMPO="$HOME/Documents/vaults/FracoVault/99_System/tiempo.py"
readonly WOFI_CONF="$HOME/.config/wofi/apunta.conf"
readonly WOFI_STYLE="$HOME/.config/wofi/style.css"

# El bind no tiene terminal donde mostrar un error, así que todo lo que haya
# que decir sale por notificación.
avisar() { # avisar <urgencia> <título> <cuerpo>
  local cuerpo="${3:-}"
  # swaync interpreta el cuerpo como markup: un `<` suelto en la frase le
  # rompe el render. Se escapa solo para mostrar, nunca para guardar.
  cuerpo="${cuerpo//&/&amp;}"; cuerpo="${cuerpo//</&lt;}"; cuerpo="${cuerpo//>/&gt;}"
  notify-send -a tiempo -u "$1" -t 3000 "$2" "$cuerpo"
}

buscar_python() {
  local c
  for c in /usr/bin/python3 /usr/local/bin/python3 /bin/python3; do
    [ -x "$c" ] && { printf '%s' "$c"; return 0; }
  done
  c="$(command -v python3 2>/dev/null)" && [ -x "$c" ] && { printf '%s' "$c"; return 0; }
  return 1
}

preguntar() {
  local args=(--dmenu --exec-search --cache-file /dev/null)
  # --exec-search es la clave: hace que Enter devuelva lo escrito en vez del
  # primer resultado. La lista va vacía a propósito; no hay nada que elegir.
  # --cache-file /dev/null para que no se guarde historial de lo apuntado.
  [ -r "$WOFI_CONF" ]  && args+=(--conf "$WOFI_CONF")
  [ -r "$WOFI_STYLE" ] && args+=(--style "$WOFI_STYLE")
  [ -r "$WOFI_CONF" ]  || args+=(--width 620 --height 64 --location center \
                                 --prompt "⏱️  ¿Qué estás haciendo?")
  printf '' | wofi "${args[@]}"
}

main() {
  local nota python salida estado

  if [ "$#" -gt 0 ]; then
    nota="$*"
  else
    # Escape mata a wofi con salida vacía; el `|| true` evita que ese código
    # de salida se confunda con un error de verdad.
    nota="$(preguntar || true)"
  fi

  # Cancelar, cerrar, o escribir solo espacios: no se apunta nada y no se
  # avisa nada. La bitácora no se toca, ni siquiera con una línea en blanco.
  nota="$(printf '%s' "$nota" | tr -d '\r' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  [ -z "$nota" ] && exit 0

  if ! python="$(buscar_python)"; then
    avisar critical "No se pudo apuntar" "no encuentro python3"
    exit 1
  fi
  if [ ! -r "$TIEMPO" ]; then
    avisar critical "No se pudo apuntar" "no encuentro $TIEMPO"
    exit 1
  fi

  # La frase va como UN solo argumento: tiempo.py busca «--hora» comparando
  # elementos completos de argv, así que mandarla entera la deja inofensiva
  # aunque contenga esa palabra.
  salida="$("$python" "$TIEMPO" apunta "$nota" 2>&1)"; estado=$?

  if [ "$estado" -ne 0 ]; then
    avisar critical "No se pudo apuntar" "$salida"
    exit "$estado"
  fi

  avisar low "⏱️ Apuntado" "$salida"
}

main "$@"
