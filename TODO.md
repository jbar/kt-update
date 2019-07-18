
### TODO (there is also some "TODO" inside sources):

* manage "^file://" URI schemes (cf. RFC8089) (for KT_SERVER_URI and inside extension directives in sources.list.d/kt-remote.list)
* support a new "#~kt:getconf:apt-preferences:..." directive, to enable pinning configuration:
    this directive should be unique if present because it is more simple and secure to manage only one file in /etc/apt/preferences.d/.
    we may call the managed file kt-update
* support new "#~kt:getconf:..." directives to manage a file /etc/kt-update/conf.d/50ktserver.conf.
    To be decided: directly (very permissive) or only some configurable values (changing APT_OPTIONS by server is the first need)
* For both previous point: Add new option to select keyring (eg: /usr/share/keyrings/debian-maintainers.gpg) to verify this files, and only accept signed and verified files of such config (security issue)
* low priority: use a default sheme if no sheme is recognized (it may me boring to always type "http://")
* low priority: support installing .deb like apt does (checking and installing also dependencies)
* low maybe: support a new "#~kt:getconf:apt-conf:..." directive to change apt conf also for apt, apt-get or aptitude.


### DONE:

* remove xsplashaa references in sources, without introducing new conf key as we could use filter to possibly send (checknfix) messages to plymouth (or xsplashaa).
* stop putting stdout and stderr together when running an action
* Remove --monitor options
