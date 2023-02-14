class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :user_id, {presence: true}
  
  belongs_to :user
  has_many :terms

  
end
