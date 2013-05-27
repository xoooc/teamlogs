class Project < ActiveRecord::Base
  attr_accessible :description, :name, :team_id
  belongs_to :team
  validates :name, :presence => true, :uniqueness => {scope: :team_id}
end
