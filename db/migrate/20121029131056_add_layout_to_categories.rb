class AddLayoutToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :layout, :string
  end
end
