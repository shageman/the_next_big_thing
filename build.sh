echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
bundle exec rake db:migrate db:test:prepare rspec
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
bundle exec rake db:migrate app:db:test:prepare rspec
result+=$?

exit $result