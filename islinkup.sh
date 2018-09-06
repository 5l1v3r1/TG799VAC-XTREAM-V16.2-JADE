# Check if Link is up using devstatus and Json

. /usr/share/libubox/jshn.sh

WANDEV="$(uci get network.wan.ifname)"

json_load "$(devstatus $WANDEV)"
json_get_var var1 speed

json_get_var var2 link

echo "Speed: $var1"
echo "Link: $var2"
