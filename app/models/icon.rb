class Icon < ApplicationRecord
  has_many :categories
  validates :name, presence: true
  validates :file_name, presence: true
end
