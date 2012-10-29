class AddExcerptToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :excerpt, :text
  end
end
