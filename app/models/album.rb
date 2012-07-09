class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  attr_accessible :title
end
