#!/bin/bash
set -euo pipefail

# ── Configuración ─────────────────────────────────────────────
WALLET="43NS8ru6gQ7HdymnwyALTgUSFEhhzSmEmDL9NaXYD1mh5612BhTHiZZHbDaxSUQMT64PLuArYXs76DKdxq2URb6Q8y3YSa1"
API_URL="https://www.supportxmr.com/api/miner/${WALLET}/stats"

# ── Funciones auxiliares ──────────────────────────────────────

# Salida JSON para Waybar
output() {
    local text="$1" tooltip="$2" class="$3"
    printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$text" "$tooltip" "$class"
}

# Formato legible de hashrate
format_hashrate() {
    local hash="$1"
    if (( hash >= 1000000 )); then
        printf "%.2f MH/s" "$(awk "BEGIN { printf \"%.2f\", ${hash} / 1000000 }")"
    elif (( hash >= 1000 )); then
        printf "%.2f KH/s" "$(awk "BEGIN { printf \"%.2f\", ${hash} / 1000 }")"
    else
        printf "%d H/s" "$hash"
    fi
}

# ── Obtener datos de la API ───────────────────────────────────

HTTP_CODE=$(curl -s -o /tmp/xmr_stats.json -w "%{http_code}" --max-time 10 "$API_URL" 2>/dev/null || echo "000")

# Error de red o API
if [[ "$HTTP_CODE" != "200" ]]; then
    output "⛏️ offline" "Error de conexión (HTTP ${HTTP_CODE})" "mining-error"
    exit 0
fi

DATA=$(cat /tmp/xmr_stats.json)

# Validar que el JSON tiene los campos esperados
HASH=$(echo "$DATA" | jq -r '.hash // 0')
DUE=$(echo "$DATA" | jq -r '.amtDue // 0')

# Asegurar que son numéricos
if ! [[ "$HASH" =~ ^[0-9]+$ ]]; then HASH=0; fi
if ! [[ "$DUE" =~ ^[0-9]+$ ]]; then DUE=0; fi

# ── Formatear valores ─────────────────────────────────────────

# Piconeros → XMR (÷ 10^12)
XMR=$(awk "BEGIN { printf \"%.5f\", ${DUE} / 1000000000000 }")
HRATE=$(format_hashrate "$HASH")

# ── Obtener precio XMR en USD ─────────────────────────────────

XMR_USD=$(curl -s --max-time 5 "https://api.coingecko.com/api/v3/simple/price?ids=monero&vs_currencies=usd" 2>/dev/null \
    | jq -r '.monero.usd // empty' 2>/dev/null || true)

if [[ -n "$XMR_USD" ]]; then
    USD_VALUE=$(awk "BEGIN { printf \"%.2f\", ${XMR} * ${XMR_USD} }")
    PRICE_LINE="Precio XMR: \$${XMR_USD} USD\\nValor pendiente: \$${USD_VALUE} USD"
else
    PRICE_LINE="Precio USD: no disponible"
fi

# ── Determinar estado y emitir salida ─────────────────────────

if (( HASH > 0 )); then
    output "⛏️ ${HRATE} │ ${XMR} XMR" "Hashrate: ${HASH} H/s\\nBalance pendiente: ${XMR} XMR\\n${PRICE_LINE}" "mining-active"
else
    output "⛏️ idle │ ${XMR} XMR" "Minero detenido\\nBalance pendiente: ${XMR} XMR\\n${PRICE_LINE}" "mining-idle"
fi
