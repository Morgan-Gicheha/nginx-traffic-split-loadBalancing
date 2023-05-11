from flask import Flask

app = Flask(__name__)
port = 5001


@app.route("/")
def hello():
    message = f"[x] main server called "

    print(message)
    return message


if __name__ == "__main__":
    import os
    os.system('cls||clear')
    print(f"[x] main server is up on port: {port}".upper())
    app.run(port=port)
