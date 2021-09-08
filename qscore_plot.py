#!/usr/bin/env python
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import gzip
import argparse

#Get required variables 
parser = argparse.ArgumentParser(description="TBD")
parser.add_argument("-r1", "--r1_filename", help="filename for read1", required=True)
parser.add_argument("-r2", "--r2_filename", help="file name for read2", required=True)
parser.add_argument("-sn", "--sample_name", help="Sample label to append to output file names", required=True)
args = parser.parse_args()

read1=str(args.r1_filename)
read2=str(args.r2_filename)

sample_name=str(args.sample_name)
# indexes = "/projects/bgmp/shared/2017_sequencing/indexes.txt"



def populate_list(fh,read_length):
    '''Takes in a fastq file with reads of length 101 and
     populates a numpy array with all of the quality scores for each base. '''

    qlist = np.zeros([read_length])
    k=1
    for line in fh:
        if k%4 ==0:
            for i,qscore in enumerate(line.strip()):
                qlist[i]+=qscore-33
            
        k+=1
    counter= k-1
    return qlist,counter


def plot_mean(mean_array,read_length,fh_name):
    '''Takes in a numpy array of means and graphs the distribution, saving the file to a given name'''
    x = range(0,read_length)
    y = mean_array
    plt.plot(x, y)
    plt.xlabel('Base', fontsize=15)
    plt.ylabel('Mean Quality Score', fontsize=15)
    plt.savefig("mean_distribution_"+str(fh_name)+".png")
    plt.close()



r1_f = gzip.open(read1)
r2_f = gzip.open(read2)


L_r1, c_r1 = populate_list(r1_f,101)
L_r2, c_r2 = populate_list(r2_f,101)



mean_r1 = L_r1/(c_r1/4)
mean_r2 = L_r2/(c_r2/4)



plot_mean(mean_r1,101,str(sample_name +" "+"read_1"))
plot_mean(mean_r2,101,str(sample_name +" "+"read_2"))


r1_f.close()
r2_f.close()
