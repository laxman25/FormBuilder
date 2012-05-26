class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
    
    if current_user.is_admin
      @users = User.temp_scope
    else
      @users = User.user_findout_user(current_user)
    end

  end

  def show
    @user=current_user
  end

  def new   
    @user = User.new
  end
  
  def create
    puts "-------------- #{current_user}"
    @user = User.user_create(params[:user], current_user) #new(params[:user])
    if @user.save      
      flash[:notice] = "Account registered!"
      redirect_to users_path      
    else
      render :action => :new
    end
  end

  def edit
    @user = current_user 
  end
  
  def update
    
    @user = User.find_by_id(params[:id])
    puts "&&&&&&&& in controller before  post #{@user.first_name.inspect}"
    if @user.update_attributes!(params[:user])
      flash[:notice] = "Account updated!"
      puts "********** in controller after post #{@user.first_name.inspect}"
      redirect_to user_path(current_user)
    else
      render :action => :edit
    end
  end
  
  
  
end
