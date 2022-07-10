import yaml
import pandas as pd


with open(r'C:\Users\94769\Downloads\sri_lanka_male\1239534.yaml') as file: # Match id should be replaced
    document = yaml.full_load(file)

inn_data = document['innings'][0] # 0 for first innings and 1 for second innings

a=inn_data['1st innings'] # 1st or 2nd innings should be specified
b=a['deliveries']



def flatten(dict1):
    output = []
    for ball,ball_det in dict1.items():
        item = []
        item.append(ball)
        helper(ball_det,item)
        output.append(item.copy())
    return output

def helper(dict2,item):
    for k,v in dict2.items():
        if isinstance(v,dict):
            helper(v,item)
        else:
            item.append(v)
    return item



info = []
ball = []
non_str = []
bowler = []
extra = []
bat_run = []
tot = []
batsman = []
player_out = []
wicket = []
ball_number = []
ball_faced = []

df = pd.DataFrame()
df_players=pd.DataFrame()

for overs in b:
    info= flatten(overs)

#below order changes according to the file format.
"""
    ball.append(info[0][0])
    non_str.append(info[0][1])
    bowler.append(info[0][2])
    #extra.append(info[0][5])
    #tot.append(info[0][6])
    #bat_run.append(info[0][4])
    #batsman.append(info[0][1])
    ball_faced.append(1)
    for j in info:
        if len(j) == 8:
            #non_str.append(info[0][4])
            batsman.append(info[0][7])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append('Non')
            wicket.append(0)
            #player_out.append(info[0][7])
            #wicket.append(1)

        elif len(j) == 9:
            #non_str.append(info[0][3])
            batsman.append(info[0][6])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append(info[0][7])
            wicket.append(1)

        elif len(j) == 10:
            #non_str.append(info[0][3])
            batsman.append(info[0][6])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append(info[0][7])
            wicket.append(1)

        elif len(j) == 11:
            #non_str.append(info[0][3])
            batsman.append(info[0][7])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append(info[0][8])
            wicket.append(1)

        elif len(j) >= 11:
            #non_str.append(info[0][4])
            batsman.append(info[0][7])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append(info[0][8])
            wicket.append(1)

        else:
            #non_str.append(info[0][3])
            batsman.append(info[0][6])
            bat_run.append(info[0][5])
            extra.append(info[0][3])
            tot.append(info[0][4])

            player_out.append('Non')
            wicket.append(0)

        #if len(j) == 10:
            #player_out.append(info[0][9])
            #wicket.append(1)
        #else:
            #player_out.append('Non')
            #wicket.append(0)

"""


df['ball_over'] = ball
df['Striker'] = batsman
df['non_striker'] = non_str
df['bowler'] = bowler
df['extra_runs'] = extra
df['batsman_runs'] = bat_run
df['tot_runs'] = tot
df['player_out'] = player_out
df['wicket'] = wicket
df['ball_faced'] = ball_faced

#print(df['ball_faced'])

p =len(df.index)

for k in range(1,p+1):
    ball_number.append(k)

df['ball_number'] =ball_number


df_players['player_name'] = batsman
df_players['runs'] = tot

#print(df_players.tail())


df.to_csv('C:/Users/94769/Documents/Research/MatchData/M94_O.csv')
#print(df['wicket'].sum())
