#!/bin/bash
# DocumentId: $Id: kt-update 2439 2007-08-02 15:59:24Z $
#

FAILED=$(echo -en "\e[31mFAILED\e[00m")
PASSED=$(echo -en "\e[32mPASSED\e[00m")

NB_ERRORS=0

#Usage example: assert "$((RANDOM%16)) -lt $((RANDOM%64))" $LINENO
_assert ()
{
	if [ $1 ] ; then
		return
	else
		echo -e "\nAssert \"$1\": $FAILED"
		echo "File \"$0\", line $2\n"    # Give name of file and line number.
		((NB_ERRORS++))
	fi
}

#Usage example: assert "sourcing bash library" $LINENO
_check ()
{
	if (($?)) ; then
		echo -e "\n$1: $FAILED"
		echo -e "File \"$0\", line $2\n"    # Give name of file and line number.
		((NB_ERRORS++))
	else
		echo -e "\n$1: $PASSED\n"
	fi
}
cd "$(dirname "$0")"

mkdir -p "tmp" "logs" "lib"

TMPDIR="$PWD/tmp"
LIBDIR="$PWD/lib"

echo -e "\nsourcing bash library:"
set | grep "^[[:alnum:]_]\+\(=\| ()\)" > ./tmp/env.1
. ../src/kt-update.env
_check "sourcing bash library" $LINENO
set | grep "^[[:alnum:]_]\+\(=\| ()\)" > ./tmp/env.2

echo -e "\nsourcing bash library changes:"
diff ./tmp/env.1 ./tmp/env.2

echo -e "\ncheck help message presence:"
for f in $(sed -n 's,^\(kt_[[:alnum:]_]\+\) () *$,\1,p' ./tmp/env.2) ; do
	grep -q "local.*\<helpmsg\>" <<<$(type $f)
	#_check "help message presence in $f" $LINENO
done

echo -e "\n(NOTE: Unitary Tests may be improved...) "

(return 0 2>/dev/null) && echo "$BASH_SOURCE: $NB_ERRORS error(s)" || exit $((NB_ERRORS>254 ? 254 : NB_ERRORS))
