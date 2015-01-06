class Event < ActiveRecord::Base

  scope :flights, where("event_type = 'Flight'")

end
