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
        $AEM_INSTALL_FOLDER/crx-quickstart/bin/start
}

stop ()
{       
        $AEM_INSTALL_FOLDER/crx-quickstart/bin/stop
}

status ()
{
        $AEM_INSTALL_FOLDER/crx-quickstart/bin/status
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
