class Condition < ActiveRecord::Base

  has_many :quote_conditions

  has_many :quotes, through: :quote_conditions
  
end
