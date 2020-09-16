#!/usr/bin/env python3
### The line above here tells the computer to execute this file with python3, so in the command line you can just do 'script.py' to run this script.
sourcefile = '../data/Space_Corrected.csv'

with open(sourcefile, 'r') as filehandle:
	tags = filehandle.readline().strip().split(',')

import pprint as pp
pp.pprint(tags)
