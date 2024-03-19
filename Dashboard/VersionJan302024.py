import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd

# Create a DataFrame with 15 rows and 5 columns
data = {
    'Test Name': ['Test {}'.format(i) for i in range(1, 16)],
    'Description': ['Description {}'.format(i) for i in range(1, 16)],
    'Passing Criteria': ['Criteria {}'.format(i) for i in range(1, 16)],
    'Has the Test Been Tested': ['Yes' if i % 2 == 0 else 'No' for i in range(1, 16)],
    'Current Result': ['Pass' if i % 3 == 0 else 'Fail' for i in range(1, 16)],
}

df = pd.DataFrame(data)

# Initialize the Dash web application
app = dash.Dash(__name__)

# Define the layout of the dashboard
app.layout = html.Div([
    html.H1("Test Dashboard"),
    dcc.Graph(
        id='test-table',
        figure={
            'data': [
                {
                    'type': 'table',
                    'header': dict(values=df.columns),
                    'cells': dict(values=df.transpose().values.tolist())
                }
            ],
        },
    )
])


# Run the web application
if __name__ == '__main__':
    app.run_server(debug=True)
