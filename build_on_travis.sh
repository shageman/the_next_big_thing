echo "*** Running container app specs"
bundle exec rake
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
bundle install
bundle exec rake
result+=$?

exit $result