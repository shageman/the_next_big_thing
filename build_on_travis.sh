echo "*** Running container app specs"
bundle exec rake db:migrate db:test:prepare rspec
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
source "$HOME/.rvm/scripts/rvm"
bundle install
bundle exec rake db:migrate app:db:test:prepare rspec
result+=$?

exit $result