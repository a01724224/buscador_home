#!/bin/bash

# Validar los argumentos
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Uso: $0 palabra [carpeta]"
    exit 1
fi

palabra="$1"
carpeta="${2:-/}"

# Validar la trayectoria
if [ ! -d "$carpeta" ]; then
    echo "Error: la carpeta no existe."
    exit 1
fi

# Convertir a trayectoria absoluta
carpeta=$(cd "$carpeta" && pwd -P) || exit 1

# Buscar la palabra dentro de los archivos
resultados=$(find "$carpeta" -type f \
    -exec grep -IlF -- "$palabra" {} + 2>/dev/null)

# Mostrar resultados
if [ -n "$resultados" ]; then
    echo "Archivos encontrados:"
    printf '%s\n' "$resultados"
else
    echo "No se encontraron archivos con la palabra: $palabra"
fi
