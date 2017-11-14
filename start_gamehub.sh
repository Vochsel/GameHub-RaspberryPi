gm=$1
NODE_ENV=node

echo "Starting Node Server with Game Mode: $gm"

$NODE_ENV GameHub-Server/server.js '$gm'
