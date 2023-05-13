cd ./servers

resolution=0

bootServer() {

    for server in */; do
        gnome-terminal --geometry=50x24+$resolution+0 --window --title="main Server" -- bash -c "cd $server;python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt ; python main.py; $SHELL"

        resolution=$((resolution + 720))

        # echo $resolution
    done

}

bootNginx() {

    # running nginx container
    gnome-terminal --geometry=200x20+0+720 --window --title="docker-Nginx-Server" -- bash -c "docker-compose up --build --force-recreate; $SHELL"

}

openBrowser() {

    # opening browser
    xdg-open 'http://127.0.0.1:5001'
    # BROWSER_PID=$!
    # kill -9 $BROWSER_PID

}

#https://www.shellscript.sh/examples/spinner/

spin() {

    spinner="/|\\-/|\\-"
    while :; do
        for i in $(seq 0 7); do

            echo -n "${spinner:$i:1}"
            echo -en "\010"
            sleep .1
        done
    done
}

echo "About to make a slow web call..."

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" $(seq 0 15)

# webservice - it is deliberately slow!
echo "[x]  Booting App Servers"
bootServer
echo "[x] Booting Nginx Server"
bootNginx
echo "[x] Waitig for Nginx to completely boot."
sleep 5
echo "opening broswer http://127.0.0.1:5001"
openBrowser

kill -9 $SPIN_PID
