class Task < ActiveRecord::Base
  attr_accessible :asignee, :deadline, :description, :name, :priority, :tag
  validates_presence_of :name
  belongs_to :project
end
