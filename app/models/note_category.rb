class NoteCategory < ActiveRecord::Base

  has_and_belongs_to_many :notes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title


  scope :single, lambda {|query| where(:id => query)}

end
