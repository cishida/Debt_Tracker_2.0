class Debt < ActiveRecord::Base
  validates :peasant, :lord, :amount, :reason, presence: true
  validates_inclusion_of :amount, :in => 1..999999999
  
  belongs_to :peasant,
    :class_name => "User",
    :foreign_key => :peasant_id

  belongs_to :lord,
    :class_name => "User",
    :foreign_key => :lord_id

  scope :sorted, lambda { order("debts.created_at DESC") }
  scope :sorted_paid, lambda { order("debts.updated_at DESC") }
end
