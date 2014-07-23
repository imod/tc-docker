#!/bin/bash

echo "> run.sh"
if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi

exec ${CATALINA_HOME}/bin/catalina.sh run

echo "< run.sh"
