class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  
  




  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ご登録ありがとうございます！"
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "変更に成功しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user_flag = User.find(params[:id])
    @user_flag.delete_flag = true
    @user_flag.save!
    log_out if logged_in?
    flash[:success] = "ご利用ありがとうございました"
    redirect_to root_path
  end

  def credit_confirm
    @user = User.find(params[:user_id])

  end

  def confirm_user_input
    @credit_confirm = Credit.find_by(user_id: session[:user_id])
  end



  

  private

    def user_params
      params.require(:user).permit(:name, :email, :address,
                                    :password,
                                    :password_confirmation)
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
