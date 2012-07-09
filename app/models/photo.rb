class Photo < ActiveRecord::Base
  belongs_to :album

  attr_accessible :title, :image
end
