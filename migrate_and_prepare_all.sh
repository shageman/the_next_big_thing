#!/bin/bash

# IMPORTANT: Source RVM as a function into local environment.
#            Otherwise switching gemsets won't work.
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

echo "migrating teaser"
cd engines/teaser && rake db:migrate app:db:test:prepare && cd ../..
echo "migrating wrapper rails app"
rake db:migrate db:test:prepare