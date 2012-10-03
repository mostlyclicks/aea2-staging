class AddSlugToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :slug, :string
    add_index :assets, :slug
  end
end
