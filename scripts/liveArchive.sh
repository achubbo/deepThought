#!/bin/bash
DATE=""
DIRNAME="MC/world"
SCREENID=""
ARCHFILE=""
SCREENID=$(screen -ls|grep pts|awk -F " " '{print $1}')

function createVars { 
  DATE=$(date +"%m-%d-%y") 
}

function archive {
  ARCHFILE=${DIRNAME}_${DATE}
  tar -cvf /app/archive/${ARCHFILE}.tar.gz /app/$DIRNAME
}

function archiveMessage {
  screen -S ${SCREENID} -X stuff 'say archiving server as '$ARCHFILE`echo -ne '\015'`
}

createVars
archive
archiveMessage
