gm=$1
NODE_ENV=node

echo "Starting Node Server with Game Mode:" $gm

lxterminal -e $NODE_ENV /home/pi/GameHub-RaspberryPi/GameHub-Server/server.js --gm TrueFriends &

sleep 2s

xte 'sleep 25' 'key F11' &
epiphany-browser http://localhost:3000/hub.html &
xte 'sleep 30' 'mousemove 100 200' &

