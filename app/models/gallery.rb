class Gallery < ActiveRecord::Base

  attr_accessible :gallery_name, :description, :gallery_pic, :gallery_path

  has_many :photos

  scope :ordered, order("galleries.created_at DESC")

end
