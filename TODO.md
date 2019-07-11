
Apart from TODO inside sources :

* manage "^file://" URI schemes (cf. RFC8089) (for KT_SERVER_URI and inside extension directives in sources.list.d/kt-remote.list)
* support a new "#~kt:auth:apt-preferences:..." directive, to enable pinning configuration:
    this directive should be unique if present because it is more simple and secure to manage only one file in /etc/apt/preferences.d/.
    we may call the managed file kt-update
* support new "#~kt:auth:..." directives to manage a file /etc/kt-update/conf.d/50ktserver.conf.
    To be decided: directly (very permissive) or only some configurable values (changing APT_OPTIONS by server is the first need)
* low priority: support a new "#~kt:auth:apt-conf:..." directive to change apt conf also for apt, apt-get or aptitude.
* Remove --monitor options
* stop putting stdout and stderr when running an action, then create conf keys ACTION_OUTFILTER_.. and  ACTION_ERRFILTER_..
* low priority: use a default sheme if no sheme is recognized (it may me boring to always type "http://")
* low priority: support installing .deb like apt does (checking and installing also dependencies)
