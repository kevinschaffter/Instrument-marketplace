class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :seller]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  def index
    @listings = Listing.all.order("created_at DESC")
  end

  def category
    @listing_category = Listing.where(category_id: params[:category_id])
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new

  def new 
    @listing = Listing.new
    @categories = Category.all.map{|c| [ c.category, c.id ] }
  end

  # GET /listings/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.category, c.id ] }
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.category_id = params[:category_id]
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing.category_id = params[:category_id]
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :category, :country, :price, :image, :description)
    end

    def check_user
      if current_user.id != @listing.user_id
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end
end
