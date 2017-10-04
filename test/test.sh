#!/bin/sh
# DocumentId: $Id: cron-apt 2439 2007-08-02 15:59:24Z ola $
#
# Copyright (C) 2007-2008 Ola Lundqvist <ola@inguza.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301 USA.

. ../src/functions

# Testing of herevariables_store and restore.
A="test a b"
A_HERE="gnarg e"

echo -n "PRECHECK: "
if [ "$A, $A_HERE, $A_STORED" = "test a b, gnarg e, " ] ; then
    echo "PASSED"
else
    echo FAILED
fi

echo -n "HERE_STORE: "
herevariables_store HERE STORED
if [ "$A, $A_HERE, $A_STORED" = "gnarg e, , test a b" ] ; then
    echo "PASSED"
else
    echo FAILED
fi

echo -n "HERE_RESTORE: "
herevariables_restore STORED ""
if [ "$A, $A_HERE, $A_STORED" = "test a b, , " ] ; then
    echo "PASSED"
else
    echo FAILED
fi
