class Category < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :deals
  validates :name, presence: true
  validates :icon, presence: true
end
