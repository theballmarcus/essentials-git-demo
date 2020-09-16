sourcefile = '../data/Space_Corrected.csv'

with open(sourcefile, 'r') as filehandle:
	tags = filehandle.readline().strip().split(',')

import pprint as pp
pp.pprint(tags)
