class Debt < ActiveRecord::Base
  validates :peasant, :lord, :amount, :reason, presence: true
  
  belongs_to :peasant,
    :class_name => "User",
    :foreign_key => :peasant_id

  belongs_to :lord,
    :class_name => "User",
    :foreign_key => :lord_id
end
