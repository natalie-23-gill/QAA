#!/user/bin/env python

import argparse


#Get required variables 
parser = argparse.ArgumentParser(description="Count unmapped and mapped reads using alligned SAM file")

parser.add_argument("-f", "--filename", help="Name of fa file", required=True)
parser.add_argument("-o", "--output_filename", help="K-mer size", required=True)
args = parser.parse_args()

file_name=str(args.filename)
output_filename =str(args.output_filename) 

file = open(file_name,"r")
out_file = open(output_filename, "x")




mapped_counter=0
unmapped_counter=0
lc=0

while True:
    line = file.readline().strip()
    
    if line == "":
        break
    if not line.startswith("@"): #check for qname
        lc+=1
        line_items =line.split()

        bit_flag = line_items[1]


        if (int(bit_flag) & 4) !=4 and (int(bit_flag) & 256) !=256: #is it mapped?
           mapped_counter+=1
        else:
            if (int(bit_flag) & 256) !=256:
                unmapped_counter+=1
        




#write out results
out_file.write(file_name+"\n")
out_file.write("Number of mapped reads: " + str(mapped_counter) +"\n")
out_file.write("Number of unmapped reads: " + str(unmapped_counter)+"\n")
out_file.write("Number of reads: " + str(mapped_counter+unmapped_counter)+"\n")
out_file.write("Number of lines: " + str(lc)+"\n")


out_file.close()
file.close()