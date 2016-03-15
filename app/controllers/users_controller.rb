class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :js
  
  include UsersHelper
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def login
    reset_session
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users
  # POST /users.json
  def create
    case params[:commit]
      when '登録する'
        @user = User.new(user_params)
        
        # if user_params[:担当者コード].in?(User.pluck(:担当者コード))
        #   # flash[:alert] = t "app.flash.login_existing"
        #   # respond_with @user, location: new_user_url
        #   error_msg = t "messages.taken"
        #   @user.errors.add(:担当者コード, error_msg)
        #   redirect_to :back
        #   return
        # end
        #
        # if !user_params[:担当者コード].in?(Shainmaster.pluck(:連携用社員番号))
        #   flash[:alert] = t "app.flash.login_new"
        #   # respond_with @user, location: new_user_url
        #   redirect_to :back
        #   return
        # end
        
        # @user.shainmaster = Shainmaster.find_by 社員番号: user_params[:担当者コード]
        flash[:notice] = t "app.flash.new_success" if @user.save
        respond_with @user, location: login_users_url
        
      when 'ログイン'

        # if ENV['admin_user'] == params[:user][:担当者コード].downcase  
        #   if ENV['admin_password'] == params[:user][:パスワード]
        #     @user = User.find_or_create_by 担当者コード: ENV['admin_user'], admin: true
        #     @user.shainmaster = Shainmaster.find_or_create_by 社員番号: ENV['admin_user'], 連携用社員番号: ENV['admin_user'], 氏名: 'admin'
        #     @user.shainmaster.shozokumaster = Shozokumaster.take
        #     @user.shainmaster.yakushokumaster = Yakushokumaster.take
        #     @user.save
        #     @user.shainmaster.save
        #   end
        # else
        #   @user = User.where('担当者コード = ? AND パスワード = ?',params[:user][:担当者コード].downcase,params[:user][:パスワード]).first
        # end

        if ENV['admin_user'] == params[:user][:担当者コード].downcase && ENV['admin_password'] == params[:user][:パスワード]
          session[:user] = ENV['admin_user']
          session[:current_user_id] = ENV['admin_user']
          redirect_to users_url
          return
        end


        @user = User.where('担当者コード = ? AND パスワード = ?',params[:user][:担当者コード].downcase,params[:user][:パスワード]).first
        
        if @user.nil?
          flash.now[:alert] = t "app.flash.login_field"
          render "login"
        else
          # todo store session
          session[:user] = @user.id
          session[:current_user_id] = @user.id
          session[:selected_shain] = @user.shainmaster.id
          check_shozai()
          check_kintai_at_day(Date.today)
          respond_with @user, location: events_url
        end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    flash[:notice] = t "app.flash.update_success" if @user.update user_params_for_update
    respond_with @user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_with @user
  end

  def change_pass
    if request.post?
      @user = User.find_by(担当者コード: params[:user][:user_code].downcase, パスワード: params[:user][:old_password])

      if !@user.nil?
        new_pass = params[:user][:new_password]
        email = params[:user][:email]
        avatar = params[:user][:avatar]

        if new_pass == params[:user][:renew_password]
          flash[:notice] = t 'app.flash.update_success' if @user.update(パスワード: new_pass, email: email, avatar: avatar)
          Mail.deliver do
            to "#{email}"
            from 'hminhduc@gmail.com'
            subject '【勤務システム】ログインパスワード変更'
            body "パスワードを変更成功できました。この際から、【#{new_pass}】でログインしてくさだい！"
          end
          redirect_to root_url
        else
          redirect_to :back, notice: '新パスワードともう一度パスワードが異なります。'
        end
      else
        redirect_to :back, notice: 'ユーザーIDまたはパスワードが間違っています。'
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:担当者コード, :担当者名称, :パスワード, :avatar, :admin, :有給残数, :email)
  end

  def user_params_for_update
    params.require(:user).permit(:担当者名称, :パスワード, :avatar, :admin, :有給残数, :email)
  end
end
