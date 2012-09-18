# The Next Big Thing [![Build Status](https://secure.travis-ci.org/shageman/the_next_big_thing.png)](https://secure.travis-ci.org/shageman/the_next_big_thing)

## What is this?

A full-fledged portal to announce the next big thing! Jumpstart the PR campaign for your next big thing by standing on the shoulder of a giant: The next big Thing!!

## What is this really?

A sample project showcasing the use of unbuilt Rails Engines and Gems. The entire app has been developed using TDD - follow the commits to see the parts evolve. Current state:

*   The main page is delivered by the `Teaser` Engine: `engines/teaser`
*   The `Annoyance` service is provided by the `Annoyance` gem: `gems/annoyance`
*   The main Rails application does not contain any application code: it does not even have an `app` directory. It is soley responsible for encapsulating and mounting the engine in the right place.

## Running the test suite
```bash
git clone https://github.com/shageman/the_next_big_thing.git
cd the_next_big_thing
bundle
./build.sh
```

## Contributing

I highly appreciate it!

Fork, pull, create, commit, push, request pull.

### What to do?

*   Add an engine that will admin the submitted entries.
*   ...

## License

    Copyright (c) 2012 Stephan Hagemann
    twitter.com/shageman
    %w(stephan.hagemann gmail.com) * "@"

    Released under the MIT license. See MIT-LICENSE file for details.