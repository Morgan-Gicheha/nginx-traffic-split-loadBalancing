from flask import Flask

app = Flask(__name__)
port = 5002


@app.route("/")
def hello():
    message = "[x] second server called"
    return message


if __name__ == "__main__":
    import os
    os.system('cls||clear')
    print(f"[x] second server is up on port: {port}".upper())
    app.run(port=port)
