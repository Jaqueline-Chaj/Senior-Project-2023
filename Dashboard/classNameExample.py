import dash
from dash import html

app = dash.Dash(__name__)

app.layout = html.Div(
    className='container',  # Adding a container class for Bootstrap styling
    children=[
        html.H1(style={'color': 'blue'}, children='Hello, Bootstrap!'),  # Set text color directly using inline style
        html.P(style={'color': 'red'}, children='This text is in red.'),  # Set text color directly using inline style
        html.Span(style={'color': 'green'}, children='This text is in green.'),  # Set text color directly using inline style
    ]
)

if __name__ == '__main__':
    app.run_server(debug=True)



