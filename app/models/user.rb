class User < ActiveRecord::Base
  has_many :albums
  
  attr_accessible :email, :password, :username
end
