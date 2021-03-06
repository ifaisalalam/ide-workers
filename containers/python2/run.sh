#!/usr/bin/env bash

if [ -z "$DEFAULT_TIMEOUT" ]; then
  export DEFAULT_TIMEOUT=5
fi

/usr/local/bin/time -f "%e\n%MKB\n%x" -o time.log -q -e run.stderr -u run.stdout -k run.stdin -t $DEFAULT_TIMEOUT python ./source.py

if [[ $? == 124 ]]; then
  echo "TLE: Execution exceeded the maximum timelimit." > tle.stderr
fi
