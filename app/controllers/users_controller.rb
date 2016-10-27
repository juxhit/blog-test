class UsersController < ApplicationController

  before_filter :authorize, :except => [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users }
    end
  end

  def report
    @users = User.all
    render json: @users
    UserMailer.report_email(params[:email]).deliver_later
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.permit(:nickname, :email, :avatar, :password, :password_confirmation)
    end

end
