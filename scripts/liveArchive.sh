#!/bin/bash
DATE=""
DIRNAME="MC"
function createVars { 
  DATE=$(date|awk -F " " '{print $4}'|sed 's/\:/\-/g')
  
}

function archive {
  tar -cvf /app/archive/${DIRNAME}_${DATE}.tar.gz /app/$DIRNAME
}

function archiveMessage {
  screen -S 2140.pts-0.deepThought -X stuff 'say archiving server'`echo -ne '\015'`
}
createVars
archive
archiveMessage
