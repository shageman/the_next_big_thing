echo "*** Running container app specs"
bundle exec rake db:migrate db:test:prepare rspec
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
bundle install
bundle exec rake db:migrate app:db:test:prepare rspec
result+=$?

exit $result