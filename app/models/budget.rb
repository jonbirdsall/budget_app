class Budget < ActiveRecord::Base
  validates :title, presence: true
end
