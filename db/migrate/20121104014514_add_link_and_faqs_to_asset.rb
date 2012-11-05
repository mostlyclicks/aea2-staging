class AddLinkAndFaqsToAsset < ActiveRecord::Migration
  def change
  	add_column :assets, :link_display_text, :string
  	add_column :assets, :link_url,			:string
  	add_column :assets, :faq_question,		:text
  	add_column :assets, :faq_answer,		:text
  end
end
