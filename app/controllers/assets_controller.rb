class AssetsController < ApplicationController

  http_basic_authenticate_with :name => ENV['HTTP_NAME'], :password => ENV['HTTP_PASS'], :only => [:new, :edit, :index]

  before_filter :load_latest_news, :except => :latest_news_release

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.find(:all, :include => :category, order: 'category_id asc')
    @categories = Category.all(order: 'name asc')
    @category = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end

  def latest_news_release
    category_pr = Category.find_by_slug("news-releases")
    @assets = Asset.find_all_by_category_id(category_pr.id, order: 'date_published desc')
    @latest_news = @assets.first
    @categories = Category.all(order: 'created_at desc')
  end

  def show_images
    @assets_images = Asset.find_all_by_asset_type('images')
    @categories = Category.all
  end

  def show_news_release_images
    @assets_news = Asset.find_all_by_asset_type('img-for-news-release')
  end

  def show_logos
    @assets_logos = Asset.find_all_by_asset_type('logos')
    @categories = Category.all 
  end

  def show_news_archives
    @categories = Category.all
    category_pr = Category.find_by_slug("news-releases")
    @assets = Asset.find_all_by_category_id(category_pr.id)
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset = Asset.find(params[:id])
    @categories = Category.all(order: 'created_at')
    @assets = Asset.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.json
  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(params[:asset])

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.json
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

private

  def load_latest_news
    category_pr = Category.find_by_slug("news-releases")
    @ln_assets = Asset.find_all_by_category_id(category_pr.id, order: 'date_published desc')
    @latest_news = @ln_assets.first
  end

end
