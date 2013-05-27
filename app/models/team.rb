class Team < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :users
  has_many :projects
  validates :name, :presence => true#, :uniqueness => {scope: :user}
end
