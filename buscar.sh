
#!/bin/bash

# Validar la cantidad de argumentos
if [ "$#" -ne 2 ]; then
    echo "Error: debes proporcionar dos argumentos."
    echo "Uso: $0 \"palabra o frase\" \"ruta de la carpeta\""
    exit 1
fi

# Guardar los argumentos
cadena="$1"
carpeta="$2"

# Validar que la palabra o frase no esté vacía
if [ -z "$cadena" ]; then
    echo "Error: la palabra o frase no puede estar vacía."
    exit 1
fi

# Validar que la carpeta exista
if [ ! -d "$carpeta" ]; then
    echo "Error: la carpeta indicada no existe o no es válida."
    exit 1
fi

# Crear una lista temporal de archivos
lista=$(mktemp)
trap 'rm -f "$lista"' EXIT

find "$carpeta" -type f -print0 > "$lista"

# Inicializar el total de apariciones
total=0

# Revisar cada archivo
while IFS= read -r -d '' archivo; do
    cantidad=$(grep -oF -- "$cadena" "$archivo" 2>/dev/null | wc -l | tr -d '[:space:]')

    if [ "$cantidad" -gt 0 ]; then
        printf "Archivo: %s\n" "$archivo"
        printf "Apariciones: %s\n" "$cantidad"
        echo "-------------------------"
        total=$((total + cantidad))
    fi
done < "$lista"

# Mostrar el resultado final
if [ "$total" -eq 0 ]; then
    echo "No se encontraron coincidencias."
else
    echo "Total de apariciones encontradas: $total"
fi

