
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    currnet_calls = 0
    message = f"[x] backup server called "
    print(message)
    return message


if __name__=='__main__':
    app.run(debug=True,host='0.0.0.0', port=5005)