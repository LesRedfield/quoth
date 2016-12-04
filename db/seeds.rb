# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

HEALTH_CONDITIONS = [
  ["Allergies", 1],
  ["Sleep Apnea", 6],
  ["Heart Disease", 17],
  ["High Cholesterol", 8],
  ["Asthma", 4]
]

HEALTH_CONDITIONS.each do |name, cost|
  Condition.create(
    name: name,
    cost: cost
  )
end

STATES = %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)

EAST_COAST_STATES = %w(ME NH MA RI CT NY NJ DE MD VA NC SC GA FL)

STATES.each do |state|
  ec = EAST_COAST_STATES.include?(state)

  State.create(
    name: state,
    east_coast: ec
  )
end

SAMPLE_QUOTES = [
  ["Kelly", "Boston", 20, 50, "female"],
  ["Josh", "Seattle", 48, 40, "male"],
  ["Jan", "New York", 35, 30, "female"],
  ["Brad", "San Francisco", 5, 20, "male"],
  ["Petr", "Los Angeles", 5, 10, "male"]
]

SAMPLE_QUOTES.each do |name, city, state_id, age, gender|
  Quote.create(
    name: name,
    city: city,
    state_id: state_id,
    age: age,
    gender: gender
  )
end

SAMPLE_QUOTE_CONDITIONS = [
  [1, 1],
  [2, 2],
  [3, 3],
  [3, 4],
  [5, 5]
]

SAMPLE_QUOTE_CONDITIONS.each do |quote_id, condition_id|
  QuoteCondition.create(
    quote_id: quote_id,
    condition_id: condition_id
  )
end
