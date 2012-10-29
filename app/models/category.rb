class Category < ActiveRecord::Base
  attr_accessible :description, :name, :layout
  has_many :assets

  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
