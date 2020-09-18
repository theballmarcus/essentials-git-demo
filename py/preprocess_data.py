### Preprocessing ###

# We create another data source, with the mission name in a separate column from the rocket name
# Additionally, remove the first column from all lines to prevent confusion

sourcefile = '../data/Space_Corrected.csv'
outputfile = '../data/Space_Processed.csv'

headers = ''
fileout = ''

with open(sourcefile, 'r') as filehandle:
	line = filehandle.readline().replace(' | ',',').strip().split(',')
	headers += ','.join(line[1:6] + ['Project_Name'] + line[6:]) + '\n'
	while len(line) > 1:
		line = filehandle.readline().replace(' | ',',').strip().split(',')
		fileout += ','.join(line[1:]) + '\n'

with open(outputfile, 'w') as filehandle:
	filehandle.write(headers)
	filehandle.write(fileout)
	