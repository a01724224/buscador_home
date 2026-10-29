#!/bin/bash

directorio=$(cd "$(dirname "$0")" && pwd)

source "$directorio/validacion.sh"
source "$directorio/busqueda.sh"
source "$directorio/resultado.sh"

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Uso: $0 palabra [carpeta]"
    exit 1
fi

palabra="$1"
carpeta="${2:-/}"

validar_carpeta "$carpeta" || exit 1

carpeta=$(cd "$carpeta" && pwd -P)

resultados=()

buscar_archivos "$carpeta" "$palabra"

mostrar_resultados


