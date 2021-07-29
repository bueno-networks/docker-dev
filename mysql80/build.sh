#!/bin/bash

CHECK="BUILDED"
COMMAND="echo '$CHECK'"

export $CHECK
export $COMMAND
source ../build.sh
