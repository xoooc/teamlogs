class Log < ActiveRecord::Base
  attr_accessible :logDate
  belongs_to :project
  belongs_to :user
  has_many :log_items
end
