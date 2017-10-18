#!/bin/bash
#
# Dynamically generate xdebug config, set remote ip to docker host
XDEBUG_INI=/usr/local/etc/php/conf.d/xdebug.ini
DOCKER_HOST=$(/sbin/ip route | awk '/default/ { print $3 }')

echo "
xdebug.remote_enable=1
xdebug.remote_port=\"9000\"
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
xdebug.profiler_output_name=\"xdebug.profile.%p.%u\"
xdebug.trace_output_name=\"xdebug.trace.%p.%u\"
xdebug.remote_host=\"$DOCKER_HOST\"
" > $XDEBUG_INI

# Allow writing to cache volume 
chown www-data /srv/app/app/cache

exec "$@"


