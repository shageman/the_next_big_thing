#!/bin/sh

exit_code=0

echo "*** Running annoyance gem specs"
bundle install | grep Installing
bundle exec rspec spec
exit_code+=$?

exit $exit_code

