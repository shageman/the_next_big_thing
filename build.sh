echo "*** Running container app specs"
source ~/.rvm/scripts/rvm
source .rvmrc
bundle exec rake
result=$?

echo "*** Running teaser engine specs"
cd engines/teaser
source ~/.rvm/scripts/rvm
source .rvmrc

bundle exec rake
result+=$?

exit $result