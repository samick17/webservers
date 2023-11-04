from flask import Flask

app = Flask(__name__)

@app.route("/api/v1/test", methods=["POST"])
def test():
    return {}
