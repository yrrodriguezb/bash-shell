#!/bin/bash
# Shell script para obtener una copia desde mysql
# Desarrollado: Yeison Rodriguez

# NOTA: 
#       Este script se ejecuta con 'cron' el cual es un administrador regular de procesos en segundo plano
#       que comprueba si existen tareas para ejecutar, teniendo en cuenta la hora del sistema.
#      
#       Las configuraciones de las tareas a ejecutar se almacenan en el archivo crontab que puede ser editado
#       con el comando crontab -e, si requerimos listar las tareas que tenemos configuradas ejecutamos crontab -l.

PATH=/usr/local/sbin:/usr/local/bin:/sbin/:/bin:/usr/sbin:/usr/bin

# Si falla algo deje de ejecutarse
set -e 

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# $0 equivale al nombre del script
readonly SCRIPT_NAME="$(basename "$0")"



function assert_is_installed {
  local readonly name="$1"

  if [[ ! $(command -v ${name}) ]]; then
    log_error "The binary ${name} is required, but It is not installed"
    exit 1
  fi  
}

function log_error {
  local readonly message="$1"
  log "Error" $message
}

function log {
  local readonly level="$1"
  local readonly message="$2"
  local readonly timestamp=$(date +"%Y-%m-%d %H:%M:%S") >&2 echo "${timestamp} [${level}] [${SCRIPT_NAME}] [${message}]"
  echo $timestamp
}


function run {
  assert_is_installed "mysql"
  assert_is_installed "mysqldump"
  assert_is_installed "gzip"
  # assert_is_installed "aws"
}


function make_backup {
  local BAK="$(echo $HOME/mysql)"
  local MYSQL="$(which mysql)"
  local MYSQLDUMP="$(which mysqldump)"
  local GZIP="$(which gzip)"
  local NOW="$(date +"%Y%m%d_%H%M%S%N")"
  #local BUCKET="XXXX"

  # Acceder a las variables de entorno
  USER=${MYSQL_USER}
  PASS=${MYSQL_PASSWORD}
  HOST=${MYSQL_HOST}
  DATABASE=${MYSQL_DATABASE}

  if [[ ! -d "$BAK" ]]; then
    mkdir -p "$BAK"
  fi

  FILE=$BAK/$DATABASE.$NOW.gz

  local SECONDS=0

  # -p$PASS, se deja sin espacios para que el shell no solicite la contraseña
  $MYSQLDUMP --single-transaction --set-gtid-purged=OFF -u $USER -h $HOST -p$PASS $DATABASE | $GZIP -9 > $FILE

  duration=$SECONDS

  # Subir al servicio de storage de aws
  # aws s3 cp $BAK "s3://$BUCKET" --recursive

  echo "$(($duration/60)) minutes."
  echo "Path Backup: $FILE" 
}

run
make_backup
