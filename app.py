from flask import Flask

app = Flask('myapp')

@app.route('/')
def default_output():
    return 'some default output'
