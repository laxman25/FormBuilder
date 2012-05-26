class SignupController < ApplicationController
skip_before_filter :require_user 

  layout false
  def new
    @user= User.new
  end

  def create
    
    @user=User.new(params[:user])
  
    @user.role_id = 3
    # @user.created_user_id = current_user.id
    # current_user.is_admin? ? "2" : "
    if@user.save
      flash[:notice]="Account registered"
      redirect_to root_path
    else
      render "new"
    end
  end

  def forgot_password
    if request.post?
      @user = User.find_by_email(params[:email])
      if @user
        redirect_to :action =>"reset_password",:email => @user.email
      else
        render :text=>"reset_password"
      end
    end
  end

  def reset_password   
    @user =User.find_by_email(params[:email])
    if request.post? and params[:user]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.save
        redirect_to root_url
      else       
        render "reset_password"
      end
    end
    
  end
   def index
    if current_user.is_admin?    
      @users = User.where(:role_id => [1, 2])
    else    
      @users = User.where("role_id = ? and created_user_id= ?","3", current_user.id)
    end

  end

  
end
