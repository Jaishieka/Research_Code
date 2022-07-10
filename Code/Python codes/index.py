import pandas as pd

MData = pd.read_csv("C:/Users/94769/Documents/Research/DataIndex/Overseas/M94_O.csv" , index_col = 0)

df = pd.DataFrame(MData)

df['Match_Number'] = 61

df_reset = df.set_index('ball_over')


df_reset.to_csv("C:/Users/94769/Documents/Research/SepData/Overseas/MI61_O.csv")
