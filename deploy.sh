ssh root@107.170.73.119 "cd /opt/everybody-plays-pokemon && git fetch && service epp stop && git reset --hard origin/master && bundle install && service epp start"
