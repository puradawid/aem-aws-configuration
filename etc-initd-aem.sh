#!/bin/bash

PATH=/sbin:/usr/sbin:$PATH
AEM_INSTALL_FOLDER=/home/ec2-user
AEM_RUN_USER=ec2-user

usage ()
{
        echo $"Usage: $0 {start|stop|status|restart|condrestart}" 1>&2
        RETVAL=2
}

        
start ()
{       
        su $AEM_RUN_USER -c $AEM_INSTALL_FOLDER/crx-quickstart/bin/start
}

stop ()
{       
        su $AEM_RUN_USER -c $AEM_INSTALL_FOLDER/crx-quickstart/bin/stop
}

status ()
{
        su $AEM_RUN_USER -c $AEM_INSTALL_FOLDER/crx-quickstart/bin/status
}


restart ()
{
        stop
        start
}


case "$1" in
    stop) stop ;;
    status) status ;;
    start) start ;;
    restart|reload|force-reload) restart ;;
    condrestart) condrestart ;;
    *) usage ;;
esac

exit $RETVAL
