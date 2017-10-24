class PagesController < ApplicationController
  def contact
  end

  def home
    @listings = Listing.all.order(created_at: :desc).limit(8)
    @categories = Category.all.map{|c| [ c.category, c.id ] }
  end
end
