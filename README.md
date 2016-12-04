#TICKLE

##Life Insurance Pricing Estimator

Simple MVP to give life insurance quotes.

###Install and Run

To run the app:

```bash
bundle install
rails server
```

To run the tests:

```bash
rspec
```

###Design Decisions

* I chose to extract pricing variables (like conditions and states) into rails
models so that they could easily be added to and made more complicated in the
future.

* Logic for other variable (like gender and age) could also be extracted similarly
in the future.

* I chose to add a state input in order to reduce ambiguity in city names.

* I chose to hard-code east coast states because querying a mapping API seemed
like overkill once I already had the state.

I wrote a small sampling of tests. The following tests could also be added:

* Testing for the other models (not just the Quote model)

* Factories for the other models

* More robust validation tests (ranges, error messages, etc)

The following changes could also be made if TICKLE is successful:

* A customer model that stores personal information separate from the Quote model

* Date of Birth instead of merely an age input

* Form partials for when the front end consists of more than just a form
