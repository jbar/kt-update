#
# Regular cron jobs for the cron-apt package
#
# Every night at 4 o'clock.
0 4	* * *	root	test -x /usr/sbin/cron-apt && /usr/sbin/cron-apt
# Every hour.
# 0 *	* * *	root	test -x /usr/sbin/cron-apt && /usr/sbin/cron-apt /etc/cron-apt/config2
# Every five minutes.
# */5 *	* * *	root	test -x /usr/sbin/cron-apt && /usr/sbin/cron-apt /etc/cron-apt/config2
