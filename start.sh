gm=$1
NODE_ENV=node

echo "Starting Node Server with Game Mode:" $gm

$NODE_ENV /home/pi/GameHub-RaspberryPi/GameHub-Server/server.js --debug &

sleep 2s

xte 'sleep 25' 'key F11' &
epiphany-browser http://localhost:3000/hub.html &


