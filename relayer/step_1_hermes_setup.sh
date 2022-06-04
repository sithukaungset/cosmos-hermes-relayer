#!/bin/sh

trap 'read -p "run: $BASH_COMMAND"' DEBUG

#----------------------------------------------------
# HERMES - CONFIGURE
#----------------------------------------------------

# Add keys

# Earth key
echo "Add earth tellurian key"
hermes -c ./config.toml keys add earth -f ./earth_tellurian_key.json 

# Mars key
echo "Add mars greenman key"
hermes -c ./config.toml keys add mars -f ./mars_greenman_key.json

# List keys
echo "List keys"
hermes -c ./config.toml keys list earth
hermes -c ./config.toml keys list mars

#----------------------------------------------------
# HERMES - START RELAYER
#----------------------------------------------------

# Open Channel
echo "Open Channel between Earth and Mars"

# Create Client for mars on earth
# hermes -c ./config.toml create client earth mars

# Create Client for earth on mars
# hermes -c ./config.toml create client mars earth

# Create a connection between earth and mars using 2 clients created above
# hermes -c ./config.toml create connection earth --client-a 07-tendermint-0 --client-b 07-tendermint-0

# Create channel between earth and mars
# This channel has identifier channel-0 on earth and channel-1 on mars.
# hermes -c ./config.toml create channel earth connection-0 --port-a transfer --port-b transfer

hermes -c ./config.toml create channel earth mars --port-a transfer --port-b transfer



# Start the Relayer
echo "Start Relaying using Hermes"
hermes -c ./config.toml start
