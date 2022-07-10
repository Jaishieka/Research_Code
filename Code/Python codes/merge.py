import os
import glob
import pandas as pd

os.chdir("C:/Users/94769/Documents/Research/MergeData/CopyOverseas")

extension = 'csv'

all_files = [i for i in glob.glob('*.{}'.format(extension))]

comHome = pd.concat([pd.read_csv(f) for f in all_files])

comHome.to_csv("mergeOverseas.csv" , index = False , encoding = 'utf-8-sig')

file = pd.read_csv("C:/Users/94769/Documents/Research/MergeData/CopyOverseas/mergeOverseas.csv")
print(file['Match_Number'].nunique())
