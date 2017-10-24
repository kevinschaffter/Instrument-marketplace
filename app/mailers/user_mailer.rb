class UserMailer < ApplicationMailer
  def listing_confirmation_email(user)
      @user = listing.user.email
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
