require 'uri'

class Category < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp}\z/,
                                             message: 'only allows valid URL of images including https//' }
end
