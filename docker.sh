#!/bin/bash

start(){
systemctl daemon-reload
systemctl start docker
}
stop(){
systemctl daemon-reload
systemctl stop docker
}
status(){
ps -ef |grep docker |grep -v grep |grep -v status
}
case "$1" in
start)
	start ;;
stop)
	stop ;;
restart)
	stop
	start
;;
status)
	status ;;
*)
	echo " Uage :start|stop|status|restart" ;;
esac
