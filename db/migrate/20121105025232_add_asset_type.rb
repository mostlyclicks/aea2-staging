class AddAssetType < ActiveRecord::Migration
  def change
  	add_column :assets, :asset_type, :string
  end

end
