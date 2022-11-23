class Deal < ApplicationRecord
  belongs_to :author, class_name: 'Customer'
  has_and_belongs_to_many :categories
  validates :name, presence: true
  validates :amount, numericality: { only_integer: false, greater_than_or_equal_to: 0 }
end
