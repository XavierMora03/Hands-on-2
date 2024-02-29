#!/bin/bash

# Función para listar el contenido de un directorio
listar_contenido() {
    read -p "Ingresa la ruta absoluta al directorio: " ruta
    ls "$ruta"
}

# Función para crear un archivo de texto con una línea de texto
crear_archivo() {
    read -p "Ingresa la cadena de texto para almacenar en el archivo: " texto
    echo "$texto" > mi_archivo.txt
    echo "Archivo creado exitosamente."
}

# Función para comparar dos archivos de texto
comparar_archivos() {
    read -p "Ingresa el nombre del primer archivo: " archivo1
    read -p "Ingresa el nombre del segundo archivo: " archivo2
    diff "$archivo1" "$archivo2"
}

# Función para mostrar el uso de awk
uso_awk() {
    echo "Ejemplo de uso de awk:"
    echo "Texto de ejemplo" | awk '{print $2}'
}

# Función para mostrar el uso de grep
uso_grep() {
    echo "Ejemplo de uso de grep:"
    echo "Texto de ejemplo" | grep "ejemplo"
}

# Menú principal
while true; do
    echo "=== Menú de Servicios ==="
    echo "1. Listar contenido de un directorio"
    echo "2. Crear archivo de texto"
    echo "3. Comparar archivos de texto"
    echo "4. Mostrar uso de awk"
    echo "5. Mostrar uso de grep"
    echo "6. Salir"
    read -p "Elige una opción (1-6): " opcion

    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "¡Hasta luego!"; exit ;;
        *) echo "Opción inválida. Inténtalo de nuevo." ;;
    esac
done
