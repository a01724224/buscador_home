#!/bin/bash

buscar_archivos() {
    local carpeta="$1"
    local palabra="$2"
    local archivo

    while IFS= read -r -d '' archivo; do
        if grep -IqwF -- "$palabra" "$archivo" 2>/dev/null; then
            resultados+=("$archivo")
        fi
    done < <(find "$carpeta" -type f -print0)
}

