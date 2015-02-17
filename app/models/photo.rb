class Photo < ActiveRecord::Base

  attr_accessible :photo_title, :description, :filename, :order

  belongs_to :gallery

end
