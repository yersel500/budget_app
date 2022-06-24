class User < ApplicationRecord
  has_many :categories

  validates :full_name, presence: true
end
