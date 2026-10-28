#!/bin/bash

validar_carpeta() {
    local carpeta="$1"

    if [[ -z "$carpeta" ]]; then
        echo "Error: debes ingresar una ruta."
        return 1
    fi

    if [[ ! -d "$carpeta" ]]; then
        echo "Error: la carpeta no existe."
        return 1
    fi

    return 0
}
