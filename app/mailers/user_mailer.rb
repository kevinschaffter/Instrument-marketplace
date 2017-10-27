class UserMailer < ApplicationMailer
  def listing_confirmation_email(listing)
      @user = listing.user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def contact_listing_owner(listing, opts)
    @listing = listing
    @user = @listing.user
    @email = opts[:email]
    @subject = opts[:subject]
    @message = opts[:message]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def contact_site_owner

  end
end