#!/bin/bash
# chkconfig:235 85 15
# description: Nginx is an HTTP server
. /etc/rc.d/init.d/functions

nginx_dir=/data/apps/nginx
start() {
        echo "Start..."
        $nginx_dir/sbin/nginx &> /dev/null
        if [ $? -eq 0 ];then
                echo "Start successful!"
        else
                echo "Start failed!"
        fi
}
stop() {
        if killproc nginx -QUIT ;then
                echo "Stopping..."
        fi
}
status() {
	ps -ef |grep nginx |grep -v grep
}
restart() {
        stop
        sleep 1
        start
}
reload() {
        killproc nginx -HUP
        echo "Reloading..."
}
configtest() {
        $nginx_dir/sbin/nginx -t
}
case $1 in
start)
        start ;;
stop)
        stop ;;
status)
        status ;;
restart)
        restart ;;
reload)
        reload ;;
configtest)
        configtest ;;
*)
        echo "Usage: nginx {start|stop|status|restart|reload|configtest}"
        ;;
esac
