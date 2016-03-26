class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :incomes
  has_many :expenses
  validates :title, presence: true
end
