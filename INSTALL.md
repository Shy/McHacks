# Instructions for configuring DigitalOcean

\curl -sSL https://get.rvm.io | bash -s stable
cd /opt && git clone git@github.com:Shy/McHacks.git everybody-plays-pokemon
cd everybody-plays-pokemon && bundle install
apt-get install redis-server x11-apps ffmpeg xvfb firefox alsa-utils imagemagick libavcodec-extra-53 -y
ln -s /opt/everybody-plays-pokemon/streaming/xvfb /etc/init.d/xvfb
chmod +x /etc/init.d/xvfb
/etc/init.d/xvfb start
DISPLAY=:5 nohup firefox file:///opt/everybody-plays-pokemon/GameBoy-Online/index.xhtml &


# TO STREAM
./streaming/stream.sh -> http://www.twitch.tv/jberlinsky
