class Asset < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :aea_file, :excerpt, :link_display_text, :link_url, :faq_question, :faq_answer, :asset_type
  attr_writer :current_step

  belongs_to :category
  mount_uploader :aea_file, AeaFileUploader

  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged

  def current_step
  	@current_step || steps.first
  end

  def steps
  	%w[select_category file_excerpt_desc]
  end
end
