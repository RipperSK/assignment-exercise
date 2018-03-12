#!/bin/bash
which nmap >/dev/null || echo "you need nmap installed, exitting" 1>&2
which nmap >/dev/null || exit 2

if [ $# -ne 1 ]; then
  echo Input only one parameter as host ip or ip range 1>&2
  exit 1
fi

results=`echo $1;nmap $1 | sed -n -e '/PORT/,/done/ p' | head -n -1`
results_hash=`echo $results|md5sum`
results_hash=${results_hash:0:33}

echo '*Target - ' $1 ': Full scan results:*'
if grep -q $results_hash scan_results.log; then
  results='No new records found in the last scan.*'
else
  echo $results_hash >> scan_results.log
fi

echo $results
