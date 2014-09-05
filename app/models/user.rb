class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :debts, :class_name => 'Debt', :foreign_key => "peasant_id"
  has_many :loans, :class_name => 'Debt', :foreign_key => "lord_id"
end
