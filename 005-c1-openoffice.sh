#!/bin/bash

chown $APACHE_USER:$APACHE_USER echo $( getent passwd "$APACHE_USER" | cut -d: -f6 )
cd /etc/init.d && wget --no-check-certificate https://raw.github.com/discoverygarden/openoffice-init-script/master/openoffice && chmod a+x openoffice
usermod --shell /bin/sh $APACHE_USER
sed -i "s|www-data|$APACHE_USER|g" /etc/init.d/openoffice
service openoffice start

#If Service doesn't start that is because apache has no shell
$SCHEDULE_OPENOFFICE_SERVICE_COMMAND

echo -e "check process openoffice\n matching \"/usr/lib/libreoffice/program/soffice.bin\"\n start program = \"/etc/init.d/openoffice start\"\n stop program = \"/etc/init.d/openoffice stop\"\n if failed host 127.0.0.1 port 8100 then restart\n if 5 restarts within 5 cycles then timeout"
$MONIT_CONF_DIR/openoffice.conf
sed -i 's|# set httpd| set httpd|g' $MONIT_CONFIG_FILE
sed -i 's|#    use address|    use address|g' $MONIT_CONFIG_FILE
sed -i 's|#    allow localhost|    allow localhost|g' $MONIT_CONFIG_FILE
sed -i 's|    allow admin:monit|#    allow admin:monit|g' $MONIT_CONFIG_FILE
sed -i 's|    allow @monit |#    allow @monit |g' $MONIT_CONFIG_FILE
sed -i 's|    allow @users readonly |#    allow @users readonly |g' $MONIT_CONFIG_FILE
service monit restart
