#!/bin/bash

# Leer la variable GITHUB_USER
GITHUB_USER="xavi-val"

# Consultar la API de GitHub
USER_DATA=$(curl -s "https://api.github.com/users/${GITHUB_USER}")

# Extraer los datos necesarios del JSON
USER_ID=$(echo "$USER_DATA" | jq -r '.id')
CREATED_AT=$(echo "$USER_DATA" | jq -r '.created_at')

# Formatear la fecha para el nombre del archivo de log
FECHA=$(date '+%Y-%m-%d')

# Crear el directorio para el log
LOG_DIR="/tmp/${FECHA}"
mkdir -p "${LOG_DIR}"

# Crear el mensaje
MENSAJE="Hola ${GITHUB_USER}. User ID: ${USER_ID}. Cuenta fue creada el: ${CREATED_AT}."

# Imprimir el mensaje
echo "${MENSAJE}"

# Escribir el mensaje en el log
echo "${MENSAJE}" >> "${LOG_DIR}/saludos.log"

