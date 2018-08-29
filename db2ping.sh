#!/usr/bin/sh

# TODO outboard the parameters
TARGET_NODE='whatever'
TARGET_REMOTE=$1
TARGET_PORT='50000'
TARGET_DB='database'
TARGET_USR=$2
TARGET_PASS='pass'

db2 uncatalog NODE ${TARGET_NODE}
db2 catalog tcpip node whatever remote ${TARGET_REMOTE} SERVER ${TARGET_PORT}

db2 uncatalog database ${TARGET_DB}
db2 catalog database ${TARGET_DB} at node ${TARGET_NODE}

db2 connect to ${TARGET_DB} user ${TARGET_USR} USING ${TARGET_PASS}
db2 ping ${TARGET_DB} 3 times
#echo Elapsed time: 0001 microseconds

db2 connect reset
db2 uncatalog database ${TARGET_DB}
db2 uncatalog NODE ${TARGET_NODE}
