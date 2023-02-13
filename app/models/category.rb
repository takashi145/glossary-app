class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 30 }

  has_many :terms
end
