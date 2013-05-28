class Team < ActiveRecord::Base
  attr_accessible :description, :name, :user_tokens
  #has_and_belongs_to_many :users
  has_many :memberships
  has_many :users, :through =>:memberships
  has_many :projects
  attr_reader :user_tokens
  validates :name, :presence => true#, :uniqueness => {scope: :user}

  def user_tokens=(ids)
  	self.user_ids = ids.split(",")
  end
end
