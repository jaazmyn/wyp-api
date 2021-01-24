# frozen_string_literal: true

class ApplicationController < ActionController::API
  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  respond_to :json

  # User Authentication
  def authenticate_user_from_token!
    auth_token = request.headers['access-token']
    
    if auth_token
      authenticate_with_auth_token(auth_token)
    else
      authentication_error
    end
  end

  private

  def authenticate_with_auth_token(auth_token) 

    unless auth_token.include?(':')
      authentication_error
    end

    user_id = auth_token.split(':').first
    user = User.find(user_id)

    if user && Devise.secure_compare(user.access_token, auth_token)
      sign_in user, store: false
    else
      authentication_error
    end
  end


  # Authentication Failure
  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: t('unauthorized')}, status: 401  # Authentication timeout
  end
end