class Right < ActiveRecord::Base

  has_many :grants
  has_many :roles, :through => :grants
  OPERATION_MAPPINGS = {
    "new" => "CREATE",
    "create" => "CREATE",
    "edit" => "UPDATE",
    "update" => "UPDATE",
    "destroy" => "DELETE",
    "show" => "READ",
    "index" => "READ"
}

  attr_accessible :resource, :operation

scope :ordered, order("rights.resource ASC")
scope :id_ordered, order("rights.id ASC")

scope :ordered_ops, :order => "field(operation,'CREATE','READ','UPDATE','DELETE')"

scope :unique_resources, :select => 'DISTINCT resource'

  def oper_resource
    "#{resource} #{operation}"
  end

end

