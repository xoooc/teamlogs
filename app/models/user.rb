class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :team_tokens, :username, :name, :searchable
  # attr_accessible :title, :body

  #has_and_belongs_to_many :teams
  has_many :memberships
  has_many :teams, :through => :memberships
  has_many :logs
  attr_accessor :login
  attr_reader :team_tokens

  validates :username, :presence => true, :uniqueness => true
  validates :name, :presence => true

  def team_tokens=(ids)
    self.team_ids = ids.split(",")
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def searchable
    self.name + ' (' + self.username + ') (' + self.email + ')'
  end
end

