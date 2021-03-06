#!/usr/bin/env python
#mapper.py

import string
import sys
import random
import argparse

FLAGS = None

def main(_):
	precent_keep = float(FLAGS.reduce_precent)/100.0
	for line in sys.stdin:
		line = line.strip()
		line = line.lower()
		
		if random.random() < precent_keep:
			if len(line) > 0:
				print('{key}'.format(key=line))

if __name__=='__main__':
	parser = argparse.ArgumentParser(description='Mapper to reduce dataset by %')
	parser.add_argument('-rp','--reduce_precent', action='store', type=int, default=10, nargs=1)


	FLAGS, unparsed = parser.parse_known_args()
	main(unparsed)