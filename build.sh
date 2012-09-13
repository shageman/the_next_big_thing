echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
bundle exec rake
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
bundle exec rake
result+=$?

exit $result