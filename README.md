# Quoth

## Life Insurance Pricing Estimator

Simple MVP to give life insurance quotes, based on the following costs:

* The base cost of insurance is $100 annually.
* For every 5 years over the age of 18 years old, the base price increases by $20.
* If a person lives on the East Coast of America, the cost is 5% lower.
* Certain health conditions increase the cost of insurance:

Condition | Relative cost increase
Allergies | 1%
Sleep Apnea | 6%
Heart Disease | 17%
High Cholesterol | 8%
Asthma | 4%

* Females have a longer life expectancy, so receive a $12 discount on the final price.

### Install and Run

To run the app:

```bash
bundle install
rails server
```

To run the tests:

```bash
rspec
```

### Design Decisions

* I chose to extract pricing variables (like conditions and states) into Rails
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

The following changes could also be made:

* A customer model that stores personal information separate from the Quote model

* Date of Birth instead of merely an age input

* Form partials for when the front end consists of more than just a form
