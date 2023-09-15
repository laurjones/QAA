#!/usr/bin/env python

import argparse 

def get_args():
    parser= argparse.ArgumentParser()
    parser.add_argument("-f1", "--filename1", help="Input filename", required=True)
    return parser.parse_args()

args = get_args()
f1=args.filename1

with open (f1, "r") as samfile:
    i=0
    mappedreads = 0
    unmappedreads = 0
    for line in samfile:
        if line.startswith("@"): 
            pass
        else: 
            bit_flag=int(line.split('\t')[1])
            #print(bit_flag)
            if (bit_flag & 256) == 256:
                pass
            elif((bit_flag & 4) != 4):  
                mappedreads +=1
            else:
                # print("unmapped :( ")
                unmappedreads+=1
       

print("Mapped reads are:", mappedreads)
print("Unmapped reads are:", unmappedreads)