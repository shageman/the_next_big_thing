#!/bin/bash

unset BUNDLE_GEMFILE
result=0

if [ "$CI" == "true" ]; then
  BUNDLE_PATH="$HOME/vendor/bundle"
fi

# Change working directory to this script's parent directory so we find the right files
cd "$( dirname "${BASH_SOURCE[0]}" )"

for test_script in $(find . -name test.sh); do
  pushd `dirname $test_script` > /dev/null
  source "$HOME/.rvm/scripts/rvm"
  rvm use $(cat .ruby-version)@$(cat .ruby-gemset) --create
  which ruby
  rvm gemset name
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
