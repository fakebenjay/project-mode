class Category < ApplicationRecord
  has_many :projects
  has_many :users, through: :projects

  validates :name, uniqueness: true, presence: true 
end
