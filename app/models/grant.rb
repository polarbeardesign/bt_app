class Grant < ActiveRecord::Base
  belongs_to :right
  belongs_to :role

  attr_accessible :right_id, :role_id

  scope :right_ordered, joins(:right).merge(Right.ordered)

end
