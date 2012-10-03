class Asset < ActiveRecord::Base
  attr_accessible :category_id, :description, :name
  belongs_to :category

  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
