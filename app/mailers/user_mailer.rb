class UserMailer < ApplicationMailer
  def listing_confirmation_email(user)
      @user = listing.user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
