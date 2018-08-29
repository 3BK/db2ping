#!/usr/bin/sh

# TODO outboard the paraters
TARGET_NODE='whatever'
TARGET_REMOTE=$1
TARGET_PORT='50000'
TARGET_DB='database'
TARGET_USR=$2
TARGET_PASS='pass'

echo db2 uncatalog NODE ${TARGET_NODE}
echo db2 catalog tcpip node whatever remote ${TARGET_REMOTE} SERVER ${TARGET_PORT}

echo db2 uncatalog database ${TARGET_DB}
echo db2 catalog database ${TARGET_DB} at node ${TARGET_NODE}

echo db2 connect to mxsnd76 user ${TARGET_USR} USING ${TARGET_PASS}
echo db2 ping ${TARGET_DB} 3 times

echo db2 connect reset
echo db2 uncatalog database ${TARGET_DB}
echo db2 uncatalog NODE ${TARGET_NODE}
