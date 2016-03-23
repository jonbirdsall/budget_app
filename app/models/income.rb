class Income < ActiveRecord::Base
  belongs_to :budget
  validates :source, presence: true
  validates :amount, presence: true
end
