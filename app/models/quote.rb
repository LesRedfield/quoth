class Quote < ActiveRecord::Base

  validates :name, :state_id, :age, :gender, presence: true

  validates :state_id, numericality: { less_than_or_equal_to: 51 }

  belongs_to :state

  has_many :quote_conditions

  has_many :conditions, through: :quote_conditions

  def add_condition(condition_id)
    QuoteCondition.create(quote_id: self.id, condition_id: condition_id)
  end

  def conditions_cost_percentage
    total = 0

    self.conditions.each do |condition|
      total += condition.cost
    end

    total
  end

  def age_cost
    20 * ((self.age - 18) / 5)
  end

  def generate_price
    return -1 if self.age < 18

    price = 100

    price += self.age_cost

    price *= 0.95 if self.state.east_coast

    price *= (1 + self.conditions_cost_percentage / 100.00)

    price -= 12 if self.gender == "female"

    self.price = price
    self.save!

    price
  end
  
end
