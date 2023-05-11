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
    gnome-terminal --geometry=200x20+0+720 --window --title="docker-Nginx-Server" -- bash -c "docker-compose up --build; $SHELL"

}

openBrowser() {
    # opening browser
    xdg-open 'http://127.0.0.1:5001'
}

spinner() {
    PID=$!
    i=1
    sp="/-\|"
    echo -n ' '
    while [ -d /proc/$PID ]; do
        printf "\b${sp:i++%${#sp}:1}"
    done
}

spinner &
bootServer&
exit & exit
