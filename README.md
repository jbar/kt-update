% kt-update(8)
% SuperSonic Imagine - Software Team
% May 2019

# NAME

kt-update - lightweight distribution management.


# SYNOPSIS

**kt** [OPTIONS...]  *ACTIONS* [OPTIONS...] ... [*+= PACKAGES...*] \[*-= PACKAGES...*]

**kt-update** [OPTIONS...]  *ACTIONS* [OPTIONS...] ... [*+= PACKAGES...*] \[*-= PACKAGES...*]

**kt** is shortest to write. Beside this, both are the same thing.

# DESCRIPTION

**kt-update** wraps apt-get to keep your distribution in a given configuration (an apt source.list containing extensions to list required packages), which may be managed remotely.

It is configurable through files \*.conf in /etc/kt-update/conf.d/. Though, the 2 main parameters KT\_SERVER\_URI and IDENTIFIER are configurable through the **saveconf** action (cf. /etc/kt-update/conf.d/90user.conf).

It may send notification using **kt-notify**. See NOTES below.

# GENERAL OPTIONS

**-S** *URI*, **--ktserver** *URI*
:  kt server to use to get a distribution configuration

**-I** *ID*, **--identifier** *ID*
:  Identifier to get a distribution configuration from kt server

**-l**, **--listids**
:  if kt server provide a list of configuration identifiers, show it and exit

**-p**, **--printconf**
:  print all configurable values and exit

**-h**, **--help**
:  print help and exit

**-V**, **--version**
:  show version and exit


# ACTIONS (need root permissions)

**getconf**, **auth**
:  get a distribution configuration (extended apt sources.list)

**check**
:  check packages configuration and packages status

**checknfix**
:  check packages conf and status, and try repair if NOK

**clean**
:  autoremove obsolete packages and purge downloaded \*.deb files

**download**
:  only download needed packages (deprecated, use -d option)

**printconf**
:  print all configurable values (same as -p option)

**saveconf**
:  save given identifier (-I) or ktserver (-S) in configurable values

**switch**
:  equivalent to: **getconf** **update** **saveconf** **clean** **upgrade** **checknfix** **clean**

**up**
:  equivalent to: **update** **upgrade**

**update**
:  check for packages updates

**upgrade**, **dist-upgrade**
:  install needed packages

**+=**, **install** *PACKAGES*...
:  install extra packages (if no conflict with distro configuration)

**-=**, **purge** *PACKAGES*...
:  purge packages (if possible by your distro configuration)


# SPECIFIC OPTIONS

## Options for update (and install,purge) actions:

**-m**, **--media** *PATH*
:  update from a path (eg: mounted ISO) in addition to other sources

**-n**, **--no-ktsource**
:  remove apt source list given by **getconf** action


## Option for **upgrade**, **install**, **purge**, **checknfix**, and **clean** actions:

**-s**, **--simulate**
:  No-act. Perform ordering simulation

## Option for **upgrade** and **install** actions:

**-d**, **--download-only**
:  Download only ; packages are only retrieved, not unpacked or installed

## Option for **saveconf** action:

**-a**, **--ask**
:  interactive mode to set and save main configurable values


## Option for clean (and switch) actions:

**-B**, **--big**
:  remove also all packages not required by your configuration (eg: those set as manually installed)


# FILES

*/etc/apt/sources.list.d/kt-media.list*, */etc/apt/sources.list.d/kt-remote.list*
:  apt source lists managed by kt-update

*/etc/kt-update/conf.d/\*.conf*
:  The configuration files. The variables you can set there should be documented in the configuration example

*/var/lib/kt-update/*
:  kt-update's homedir

*/var/log/kt-update\* *
:  kt-update's logs


# DIAGNOSTICS

returns zero on normal operation, non-zero on errors.


# EXAMPLES

**sudo kt up**
:  upgrade your distribution

**sudo kt checknfix**
:  Check and possibly fix your distribution (eg: power cut during upgrade)

**sudo kt -I testing-games -B switch**
:  change your configuration to the one identified as "testing-games", removing all packages not specified by this configuration

**sudo kt += vim -= emacs**
:  install vim, purge emacs (if possible by your configuration)


# SEE ALSO

kt-notify, tasksel, cron-apt


# NOTES

Today, June 2019, kt-notify is still in its early stage of development and only support libnotify (with progress bar), but it should support modules to send notifications through dbus or email, etc.

For any suggestion please send email to: <jean-jacques.brucker@supersonicimagine.com>

