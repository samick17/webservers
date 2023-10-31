from flask import Flask

app = Flask(__name__)

@app.route("/api/v1/test")
def test():
    return {}
