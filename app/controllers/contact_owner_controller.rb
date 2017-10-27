class ContactOwnerController < ApplicationController

def create
  @listing = Listing.find(params[:listing_id])
  opts = {
    name: params[:name],
    email: params[:email],
    subject: params[:subject],
    message: params[:message]
  }
  UserMailer.contact_listing_owner(@listing, opts).deliver_later
end


end