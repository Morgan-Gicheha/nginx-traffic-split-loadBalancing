
from flask import Flask

app = Flask(__name__)

currnet_calls = 0

@app.route('/')
def hello():

    message = f"[x] second server called [${currnet_calls}]"
    print(message)
    return message


if __name__=='__main__':
    app.run(debug=True,host='0.0.0.0', port=5002)