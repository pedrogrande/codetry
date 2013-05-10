class Poem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :language, :slug, :title, :tag_list, :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable
  acts_as_taggable_on :tags

  self.per_page = 1

  has_many :comments, :dependent => :destroy
  #accepts_nested_attributes_for :comments

  is_impressionable

  acts_as_votable

  acts_as_taggable
  acts_as_taggable_on :languages


  default_scope order: 'poems.created_at DESC'


end
