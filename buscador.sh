#!/bin/bash

# Validar la cantidad de argumentos
if [ "$#" -eq 0 ]; then
    echo "Error: debes indicar la palabra que deseas buscar."
    exit 1
fi

if [ "$#" -gt 2 ]; then
    echo "Error: solo se permiten dos argumentos como maximo."
    exit 1
fi

# Obtener la palabra a buscar
palabra="$1"

# Obtener la trayectoria o buscar desde la raiz
if [ "$#" -eq 2 ]; then
    carpeta="$2"
else
    carpeta="/"
fi

# Validar que la trayectoria exista
if [ ! -d "$carpeta" ]; then
    echo "Error: la trayectoria indicada no existe o no es una carpeta."
    exit 1
fi

# Convertir a trayectoria absoluta
carpeta=$(cd "$carpeta" && pwd -P)

# Buscar la palabra en los archivos
find "$carpeta" -type f -exec grep -IlF -- "$palabra" {} + 2>/dev/null
