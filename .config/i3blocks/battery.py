#!/bin/python3

# Output the battery level

import os
import sys
import subprocess

e = subprocess.run(["acpi", "-b"], capture_output = True)
e = (e.stdout.decode()).split("\n")[0][11:]

finito = False
res = ""

for c in e:
    if(not finito):
        res += c
        if(c == "%"):
            finito = True

print(res)
