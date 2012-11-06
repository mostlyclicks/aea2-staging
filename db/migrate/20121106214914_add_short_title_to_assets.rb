class AddShortTitleToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :short_title, :string
  end
end
