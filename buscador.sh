#!/bin/bash

# Cargar funciones de los integrantes
directorio=$(cd "$(dirname "$0")" && pwd)

source "$directorio/validacion.sh"
source "$directorio/busqueda.sh"
source "$directorio/resultados.sh"

# Solicitar la ruta
read -r -p "Ingresa la ruta de la carpeta: " carpeta

# Validar la carpeta
validar_carpeta "$carpeta" || exit 1

# Convertir la ruta a una ruta absoluta
carpeta=$(cd "$carpeta" && pwd -P)

# Buscar la palabra home
resultados=()
buscar_archivos "$carpeta"

# Mostrar resultados
mostrar_resultados

