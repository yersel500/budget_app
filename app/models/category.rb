class Category < ApplicationRecord
  belongs_to :user
  has_many :operations

  validates :name, presence: true
  validaye :icon, presence: true
end
