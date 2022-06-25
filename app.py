from flask import Flask

app = Flask(__name__)

@app.route('/')
def mainPage():
    return "<h1>Flask with Docker and Nomad update!!!!</h1>"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
