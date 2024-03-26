from dash import Dash, dash_table
import pandas as pd

csv_file_path = 'your_data.csv' 
df = pd.read_csv(csv_file_path)

# Define counters
tests_passed = 0
tests_failed = 0
entry_error = 0
tests_not_runned = 0
other_entry_error = 0

# Iterate over each row
for index, row in df.iterrows():
    # Check if column 2 has 'Y' and column 3 has 'P'
    if row[2] == 'Y' and row[3] == 'P':
        tests_passed += 1
        df.at[index, 'Color'] = 'green'
    # Check if column 2 has 'Y' and column 3 has 'F'
    elif row[2] == 'Y' and row[3] == 'F':
        tests_failed += 1
        df.at[index, 'Color'] = 'red'
    # Check if column 2 has 'Y' and column 3 has neither 'P' nor 'F'
    elif row[2] == 'Y' and row[3] != 'P' and row[3] != 'F':
        entry_error += 1
        df.at[index, 'Color'] = 'yellow'
    # Check if column 2 has 'N'
    elif row[2] == 'N':
        tests_not_runned += 1
        df.at[index, 'Color'] = 'gray'
    # Check if column 2 has neither 'N' nor 'Y'
    else:
        other_entry_error += 1
        df.at[index, 'Color'] = 'orange'

# Print the counts
print("Tests Run and Passed:", tests_passed)
print("Tests Run and Failed:", tests_failed)
print("Entry Errors (Y with neither P nor F):", entry_error)
print("Tests Not Run:", tests_not_runned)
print("Other Entry Errors:", other_entry_error)

# Display summary report
print("\nSummary Report:")
print("Total tests run:", tests_passed + tests_failed)
print("\tNumber passed:", tests_passed)
print("\tNumber failed:", tests_failed)
print("Total tests not run:", tests_not_runned)
print("Total lines with entry errors:", entry_error + other_entry_error)

# Set up Dash app
app = Dash(__name__)

# Add color-coded column
df['Color'] = ''

app.layout = dash_table.DataTable(
    id='table',
    columns=[
        {"name": i, "id": i} if i != 'Color' else {"name": i, "id": i, 'presentation': 'dropdown'}
        for i in df.columns
    ],
    data=df.to_dict('records'),
    style_data_conditional=[
        {
            'if': {'column_id': 'Status', 'filter_query': '{Color} = "green"'},
            'backgroundColor': 'lightgreen',
            'color': 'black'
        },
        {
            'if': {'column_id': 'Color', 'filter_query': '{Color} = "red"'},
            'backgroundColor': 'salmon',
            'color': 'black'
        },
        {
            'if': {'column_id': 'Color', 'filter_query': '{Color} = "yellow"'},
            'backgroundColor': 'yellow',
            'color': 'black'
        },
        {
            'if': {'column_id': 'Color', 'filter_query': '{Color} = "gray"'},
            'backgroundColor': 'lightgray',
            'color': 'black'
        },
        {
            'if': {'column_id': 'Color', 'filter_query': '{Color} = "orange"'},
            'backgroundColor': 'orange',
            'color': 'black'
        }
    ]
)

if __name__ == '__main__':
    app.run_server(debug=True)
