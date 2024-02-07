from dash import Dash, dash_table
import pandas as pd
import numpy as np


csv_file_path = 'your_data.csv'  # Replace with the path to your CSV file
df = pd.read_csv(csv_file_path)

df_dict = df.to_dict('records')
df_numpy = df.to_numpy()

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

app = Dash(__name__)

app.layout = dash_table.DataTable(df.to_dict('records'), [{"name": i, "id": i} for i in df.columns])

if __name__ == '__main__':
    app.run(debug=True)