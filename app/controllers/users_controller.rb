class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    begin
      @user = User.find(params[:id])
      redirect_to root_url and return if @user.nil?
    rescue
      redirect_to root_url and return
    end
  end
  
  def trees
    begin
      @user = User.find(params[:id])
      @trees = Tree.find(@user)
      redirect_to root_url and return if @user.nil?
    rescue
      redirect_to root_url and return
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #@user.send_activation_email
      @user.update(:activated => true)
      flash[:info] = 'Faça login.'
      redirect_to login_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts @user
    if @user.update_attributes(user_params)
      flash[:success] = 'Perfil atualizado'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Usuário deletado'
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :address, :mobile, :facebook, :twitter, :telegram)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Por favor, faça login.'
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end