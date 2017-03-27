class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  belongs_to :category

  validates :name, uniqueness: true, presence: true
  validates :category_id, presence: true
end
