class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def generate_otp
    hotp = ROTP::HOTP.new(@user.otp_secret)
    @user.last_otp = hotp.at(rand(10..100))
    @user.save!
  end
end
