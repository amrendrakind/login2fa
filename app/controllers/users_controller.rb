class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[useremail create]
  # GET /users
  def index
    @users = User.all
    render json: { id: @user.id, email: @user.email, created_at: @user.created_at, updated_at: @user.updated_at }
  end

  # GET /users/1
  def show
    render json: { id: @user.id, email: @user.email, created_at: @user.created_at, updated_at: @user.updated_at }
  end

  # Authenticate user email id

  def useremail
    @user = User.find_by_email!(params[:email])
    render json: { id: @user.id, email: @user.email, created_at: @user.created_at, updated_at: @user.updated_at }
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.otp_secret = ROTP::Base32.random
    if @user.save
      render json: { id: @user.id, email: @user.email, created_at: @user.created_at, updated_at: @user.updated_at },
             status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def verify_otp
    @user = User.find_by_email!(params[:email])
    totp = @user.last_otp
    if totp.eql? params[:last_otp]
      render json: { otp: 'verified' }
    else
      render json: { otp: 'Not verified' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:email, :last_otp)
  end
end
