#!/bin/bash

for gemfile in $(find . -name Gemfile); do
  pushd `dirname $gemfile`
  bundle
  popd
done
