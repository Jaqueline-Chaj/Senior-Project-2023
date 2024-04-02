from dash import Dash, dash_table
import pandas as pd
import numpy as np
from dash import html, dcc
from dash.dependencies import Input, Output


csv_file_path = 'Testinglog.csv' 
df = pd.read_csv(csv_file_path)

df_dict = df.to_dict('records')
df_numpy = df.to_numpy()

# Define counters
tests_passed = 0
tests_failed = 0
entry_error = 0
tests_not_runned = 0
other_entry_error = 0

# Iterate over each row
for row in df_numpy:
    # Check if column 2 has 'Y' and column 3 has 'P'
    if row[2] == 'Y' and row[3] == 'P':
        tests_passed += 1
     
    # Check if column 2 has 'Y' and column 3 has 'F'
    elif row[2] == 'Y' and row[3] == 'F':
        tests_failed += 1
    # Check if column 2 has 'Y' and column 3 has neither 'P' nor 'F'
    elif row[2] == 'Y' and row[3] != 'P' and row[3] != 'F':
        entry_error += 1
    # Check if column 2 has 'N'
    elif row[2] == 'N':
        tests_not_runned += 1
    # Check if column 2 has neither 'N' nor 'Y'
    else:
        other_entry_error += 1

df2 = pd.DataFrame({
    'Final': ["Tests Run and Passed:", "Tests Run and Failed:","Entry Errors (Y with neither P nor F):","Tests Not Run:","Other Entry Errors:"],
    'Results': [tests_passed, tests_failed, entry_error,tests_not_runned, other_entry_error]
})
# Print the counts
print("Tests Run and Passed:", tests_passed)
print("Tests Run and Failed:", tests_failed)
print("Entry Errors (Y with neither P nor F):", entry_error)
print("Tests Not Run:", tests_not_runned)
print("Other Entry Errors:", other_entry_error)

# Go through every row of df_numpy and count:
#    the number of rows where column 2 has a 'Y' and column 3 has a 'P' -- these are tests run, and passed
#    the number of rows where column 2 has a 'Y' and column 3 has a 'F' -- these are tests run, and failed
#    the number of rows where column 2 has a 'Y' and column 3 has neither P or F -- these are rows with some kind of entry error
#    the number of rows where column 2 has a 'N' -- these are rows with tests not run
#    the number of rows where column 2 has either 'N' nor 'Y' -- these are rows with some kind of entry error

# Report:
#       Total tests run
#           Number passed
#           Number failed
#       Total tests not run
#       Total lines with entry errors

# The sum of all of these should equal the total number of lines in the CSV file minus one, since first line is heading
#Color code the passed and failed red, yellow, green etc. 
#Display 

                                #'minWidth':100,'width':200 ,'maxWidth':800
#,{'if':{'Test Name'}, 'width':'10%'}
 

app = Dash(__name__)
 
app.layout = html.Div( 
    className='container',  # Adding a container class for Bootstrap styling
    children= [ 
        html.H1("Tests"), 
               dash_table.DataTable(df.to_dict('records'), style_cell={'textAlign':'left', 'whiteSpace': 'normal','height':'auto', 'color':'white'}, \
                                  columns=[{"name": i, "id": i} for i in df.columns],
                                     style_header={'backgroundColor': '#192734', 'color': 'white','fontWeight' :'bold', 'fontSize':18}, \
                                     
                                 style_cell_conditional=[{'if' : {'column_id':'Has the test been tested? (Y/N)'},'width':'10%'}, \
                                                         {'if' : {'column_id':'Current Result (P/F/X)'}, '        width':'10%'}, 
                                                         {'if' : {'column_id':'Status'}, 'color': 'lime'},
                                                         {'if' : {'column_id':'Test run?'}, 'color': 'lime'},
                                                         {'if': {'column_id': 'Status', 'filter_query': '{Color} = "green"'},
                                                            'backgroundColor': 'lightgreen',
                                                            'color': 'black'
                                                        }
                                                        
                                                          ] ,
                                style_data = {'backgroundColor': '#192734','text-wrap' : 'wrap'}, 

                                #style_data_conditional = [ { 'if': { 'filter_query': '{Status} contains "F"'},'backgroundColor': '#192734', 'color': 'red' } ]
                                                          
                                                   


                                    ),
    
        html.H2("Report"),
        dash_table.DataTable(
            id='table2',
            style_cell={'textAlign':'left', 'whiteSpace': 'normal','width': '20%', 'margin': 'auto'}, 
            columns=[{"name": i, "id": i} for i in df2.columns],
            data=df2.to_dict('records'),
            style_cell_conditional=[ 
                    {'if': {'column_id': 'Final'}, 'width': '10%'},
                    {'if': {'column_id': 'Results'},'width': '10%'},],
            style_filter = {
            'backgroundColor': '#252e3f',
            'color': 'white'
        },
        style_header = {
            'backgroundColor': '#181818',
            'color': 'white','fontWeight' :'bold', 'fontSize':18
        },
        style_data = {
            'backgroundColor': '#192734',
            'color': 'white',
            'text-wrap' : 'wrap'
        },
    #    style_cell = {
     #       'overflow': 'hidden',
      #      'textOverflow': 'ellipsis',
       #     'maxWidth': 0
        #}
                                    
                                    )    

    ])

if __name__ == '__main__':
    app.run(debug=True)

    