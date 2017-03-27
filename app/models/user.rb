class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :categories, through: :projects

  validates :name, presence: true, uniqueness: true,
    format: { without: /\s/ }
end
