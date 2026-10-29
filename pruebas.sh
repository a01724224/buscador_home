#!/bin/bash

echo "PRUEBA 1: Sin argumentos"
./buscador.sh
echo "Codigo de salida: $?"
echo "-------------------------"

echo "PRUEBA 2: Mas de dos argumentos"
./buscador.sh home Documents extra
echo "Codigo de salida: $?"
echo "-------------------------"

echo "PRUEBA 3: Buscar una palabra en Documents"
./buscador.sh home "$HOME/Documents"
echo "Codigo de salida: $?"
echo "-------------------------"

echo "PRUEBA 4: Buscar sin especificar carpeta"
./buscador.sh home
echo "Codigo de salida: $?"
