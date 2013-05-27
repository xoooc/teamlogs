class LogItem < ActiveRecord::Base
  attr_accessible :description, :kind, :name, :tag
  belongs_to :log
end
