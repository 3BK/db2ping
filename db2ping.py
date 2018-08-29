#!/usr/bin/python

import subprocess
import re
import os,sys,logging
from time import localtime,strftime
import time

SERVER="localhost.localdomain.local"
USER  ="someuser"

indexTime = "[" + strftime("%m/%d/%Y %H:%M:%S %p %Z",localtime()) + "]"

print ("time,server,user,microseconds,down")
try: 
  reg = "Elapsed time: [0-9]* microseconds"
  p = subprocess.Popen(["./db2ping.sh", SERVER, USER], stderr=subprocess.STDOUT, stdout=subprocess.PIPE)
  for line in iter(p.stdout.readline, b''):
    ml = re.search(reg, line)
    if ml:
      print ("%s,%s,%s,%s,0" % (indexTime, SERVER, USER, line.split()[2]))
      
except Exception as e: 
  print ("%s,%s,%s,3600000000,1" %(indexTime, SERVER, USER))


