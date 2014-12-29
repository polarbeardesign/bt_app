class Note < ActiveRecord::Base

  has_and_belongs_to_many :note_categories
  accepts_nested_attributes_for :note_categories

  attr_accessible :title, :note

end
