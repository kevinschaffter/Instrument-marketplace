class PagesController < ApplicationController
  def contact
  end

  def home
    @listings = Listing.limit(8)
    @categories = Category.all
  end
end
