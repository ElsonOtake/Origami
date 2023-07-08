class Category < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :deals
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]
end
