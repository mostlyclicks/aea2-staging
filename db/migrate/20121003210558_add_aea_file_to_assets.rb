class AddAeaFileToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :aea_file, :string
  end
end
