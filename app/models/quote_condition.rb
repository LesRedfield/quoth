class QuoteCondition < ActiveRecord::Base

  validates :quote_id, :condition_id, presence: true

  validates :quote_id, :uniqueness => { :scope => :condition_id }

  belongs_to :quote

  belongs_to :condition
  
end
