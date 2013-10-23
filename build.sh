#!/bin/bash

unset BUNDLE_GEMFILE
result=0

if [ "$CI" == "true" ]; then
  BUNDLE_PATH="$HOME/vendor/bundle"
fi

for test_script in $(find . -name test.sh); do
  pushd `dirname test_script` > /dev/null
  ./test.sh
  result+=$?
  popd > /dev/null
done

if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result