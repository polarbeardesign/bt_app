class Post < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :content, :published, :user_id
  
  scope :reverse, order("posts.created_at DESC")

end
