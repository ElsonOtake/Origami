class Category < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  has_and_belongs_to_many :deals
  validates :name, presence: true
end
