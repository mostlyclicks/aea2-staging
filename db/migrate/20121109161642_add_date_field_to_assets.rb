class AddDateFieldToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :date_published, :date
  end
end
