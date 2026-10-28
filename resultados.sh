#!/bin/bash

mostrar_resultados() {
    local archivo
    local total=${#resultados[@]}

    echo "--------------------------------"
    echo "Resultados de busqueda: home"
    echo "--------------------------------"

    for archivo in "${resultados[@]}"; do
        echo "Encontrado en: $archivo"
    done

    echo "--------------------------------"
    echo "Total de archivos encontrados: $total"
}

