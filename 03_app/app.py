from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify(status="ok"), 200

@app.route("/hello/<name>")
def hello(name):
    return jsonify(message=f"Hello {name}!"), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
