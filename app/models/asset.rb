class Asset < ActiveRecord::Base
  attr_accessible :category_id, :description, :name
  belongs_to :category
end
