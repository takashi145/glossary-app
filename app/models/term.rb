class Term < ApplicationRecord
  belongs_to :category, optional: true

  belongs_to :user

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  
  validates :description, presence: true, length: { minimum: 1 }

end
