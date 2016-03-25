class Expense < ActiveRecord::Base
  belongs_to :budget
  validates :name, presence: true
  validates :amount, presence: true
end