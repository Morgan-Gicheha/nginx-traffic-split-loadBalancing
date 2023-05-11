
from flask import Flask

app = Flask(__name__)
port=5005
@app.route('/')
def hello():
    currnet_calls = 0
    message = f"[x] backup server called "
    print(message)
    return message


if __name__=='__main__':
    import os
    os.system('cls||clear')
    print(f"[x] backup server is up: {port}".upper())
    app.run(port=port)