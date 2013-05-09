class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :poem
  attr_accessible :content, :user_id, :poem_id	

  validate :content, :presence => true

  has_many :poems


  
end
