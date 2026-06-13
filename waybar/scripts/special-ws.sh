#!/usr/bin/env bash
# Waybar indicator: active when focused workspace is a Hyprland "special" (scratchpad) workspace.

emit() {
    local name label
    name=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.name // empty')

    if [[ "$name" == special:* || "$name" == "special" ]]; then
        label="${name#special:}"
        [[ -z "$label" ]] && label="scratch"
        printf '{"text":"󰌾 %s","class":"active","tooltip":"Special workspace: %s"}\n' "$label" "$name"
    else
        printf '{"text":"","class":"inactive","tooltip":""}\n'
    fi
}

emit

SOCKET="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"
[[ -S "$SOCKET" ]] || exit 0

ncat -U "$SOCKET" | while IFS= read -r line; do
    case "${line%%>>*}" in
        activespecial|activespecialv2|workspace|workspacev2|focusedmon|focusedmonv2)
            emit
            ;;
    esac
done
