class AddExcerptToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :excerpt, :text
  end
end
