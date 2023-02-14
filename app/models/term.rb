class Term < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  
  validates :description, presence: true, length: { minimum: 1 }

end
