class Team < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name
  has_and_belongs_to_many :users
end
