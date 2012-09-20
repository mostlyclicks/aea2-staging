class Asset < ActiveRecord::Base
  attr_accessible :category_id, :description, :name
end
