class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[useremail create]
  before_create :generate_otp
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  #Authenticate user email id

  def useremail
    @user = User.find_by_email!(params[:email])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      render json: @user, status: :created
      # Tell the UserMailer to send a welcome email after save
    #  UserMailer.with(user: @user).welcome_email.deliver_now

    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def generate_otp
    self.otp_secret = ROTP::Base32.random
    p "OTP is "
    puts @otp_secret
  end

  # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:email)
    end
end
