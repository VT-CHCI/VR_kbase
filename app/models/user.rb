class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_papers
  has_many :papers, :through => :user_papers
  has_many :user_authors, :dependent => :destroy
  has_many :authors, :through => :user_authors

  accepts_nested_attributes_for :user_papers
  accepts_nested_attributes_for :user_authors
  accepts_nested_attributes_for :papers
  accepts_nested_attributes_for :authors

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body
end
