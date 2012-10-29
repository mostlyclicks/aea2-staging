class Asset < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :aea_file, :excerpt
  belongs_to :category
  mount_uploader :aea_file, AeaFileUploader

  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
