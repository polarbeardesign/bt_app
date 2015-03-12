class Event < ActiveRecord::Base

  attr_accessible :event_type, :title, :description, :location, :start, :end

  scope :flights, where("event_type = 'Flight'")
  
  scope :lodging, where("event_type = 'Lodging'")
  
  scope :grdtrnsp, where("event_type = 'Ground Transportation'")
  
  scope :transp, where("event_type = 'Flight' or event_type = 'Ground Transportation'")
  
  scope :ordered, order("events.start ASC")

end
