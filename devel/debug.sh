#!/bin/bash
set -e

bin/develop rb

if [ -z "$1" ]; then
  echo "============================================================="
  echo "All set. Now you can dive into container and start debugging:"
  echo "                                                             "
  echo "    $ docker exec -it <container_name_or_id> bash            "
  echo "    $ ps aux                                                 "
  echo "    $ bin/instance fg                                        "
  echo "                                                             "
  echo "============================================================="
  exec cat
fi

if [ "$1" == "tests" ]; then
 for i in $(ls src); do

   # Auto exclude tests
   if ! grep -q "$i" bin/test; then
       echo "============================================================="
       echo "Auto: Skipping tests for: $i                                 "
       continue
   fi

   # Manual exclude tests
   if [ ! -z "$EXCLUDE" ]; then
     if [[ $EXCLUDE == *"$i"* ]]; then
       echo "============================================================="
       echo "Manual: Skipping tests for: $i                               "
       continue
     fi
   fi

   # Run tests
   echo "============================================================="
   echo "Running tests for:                                           "
   echo "                                                             "
   echo "    $i                                                       "
   echo "                                                             "

   ./bin/test --test-path /plone/instance/src/$i -v -vv -s $i
  done
fi

exec "$@"