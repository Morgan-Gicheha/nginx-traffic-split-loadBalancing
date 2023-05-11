
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():

    message = f"[x] main server called "

    print(message)
    return message

if __name__=='__main__':
    app.run(debug=True,host='0.0.0.0', port=5001)