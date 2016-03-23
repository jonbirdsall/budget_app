class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :incomes
  validates :title, presence: true
end
