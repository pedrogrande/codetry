class Poem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :language, :slug, :title

  extend FriendlyId
  friendly_id :title, use: :slugged
end
