# The Next Big Thing [![Build Status](https://secure.travis-ci.org/shageman/the_next_big_thing.png)](https://secure.travis-ci.org/shageman/the_next_big_thing) [![Dependency Status](https://gemnasium.com/shageman/the_next_big_thing.png)](https://gemnasium.com/shageman/the_next_big_thing)

## What is this?

A full-fledged portal to announce the next big thing! Jumpstart the PR campaign for your next big thing by standing on the shoulder of a giant: The next big Thing!!

## What is this really?

A sample project showcasing the use of unbuilt Rails Engines and Gems. The entire app has been developed using TDD - follow the commits to see the parts evolve. Current state:

*   `Teaser` provides the web page one sees when running the the_next_big_thing server. It depends on all the other engines.
*   `Annoyance` contains a service that given a number will give an indication of how annoying that number is.
*   `EmailSignup` provides a service allowing the storage of email addresses.
*   `EventCounter` provides a service that can count for any object how many times a particular action has happened.
*   The main Rails application does not contain any application code: it does not even have an `app` directory. It is soley responsible for encapsulating and mounting the engine in the right place.

## Running the test suite
```bash
git clone https://github.com/shageman/the_next_big_thing.git
cd the_next_big_thing
./build.sh
```

##Issues
*    gems need update
*    there is a solution to the gem requirement problem on travis
*    it is possible to use route helpers in engines

## Contributing

I highly appreciate it!

Fork, pull, create, commit, push, request pull.

## License

    Copyright (c) 2012-2013 Stephan Hagemann
    twitter.com/shageman
    %w(stephan.hagemann gmail.com) * "@"

    Released under the MIT license. See MIT-LICENSE file for details.
