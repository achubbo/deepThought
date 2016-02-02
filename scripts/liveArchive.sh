#!/bin/bash
DATE=""
DIRNAME="MC"
function createVars { 
  DATE=$(date|awk -F " " '{print $4}'|sed 's/\:/\-/g')
  
}

function archive {
  tar -cvf /app/archive/${DIRNAME}_${DATE}.tar.gz /app/$DIRNAME
}
createVars
archive
