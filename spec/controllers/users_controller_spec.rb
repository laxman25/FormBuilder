require 'spec_helper'

describe UsersController do

  before(:each) do
    @current_user = mock_model(User, :id => 1, :is_admin => true)
    controller.stub!(:require_user).and_return(true)
#    controller.stub!(:current_user).and_return(@current_user)
  end

  def mock_user(stubs = {})
    @mock_user = mock_model(User, {:id => "1", :created_user_id => "1", :first_name=> "sasideep", :last_name=> "ram12", :phone_number=> "9999999990", :is_admin=> true , :role_id=> "3", :email=> "sasideep11110005@live.com",:password=>"test123",:password_confirmation=>"test123"})
  end

  describe "new" do

    def do_get
      get :new
    end


    it "should render a new page" do
      User.should_receive(:new).and_return(mock_user)
      do_get
      response.should be_success
      assigns(:user).should eq(@mock_user)
      response.should render_template('users/new')
    end

  end

  describe "index" do
    #     @user = Factory.create(:user)
     
    it"should show index page" do
        params={:user=>{:first_name=> "sasideep1235", :last_name=> "ram12",
          :phone_number=> "", :is_admin=> true, :role_id=> "2",
          :email=> "sasideep1232325@live.com",:password=>"test123",:password_confirmation=>"test123"}}
#          User.should_receive(params).and_return(@mock_user)
          controller.stub!(:current_user).and_return(@current_user)
#          controller.should_receive(:current_user).with().and_return(@current_user)
#      .and_return(true)
      get :index
    end
  end

  describe "create " do
    def do_post(params={})
      #puts "params ^^^^^^ #{params.inspect}"
      post :create, params
    end
    it "should not create a new user when user doesnt give his ph1one number" do

      params={:user=>{:first_name=> "sasideep1235", :last_name=> "ram12",
          :phone_number=> "", :is_admin=> false, :role_id=> "2",
          :email=> "sasideep1232325@live.com",:password=>"test123",:password_confirmation=>"test123"}}
      #     User.should_receive(:user_create).with(params[:user], nil).and_return(mock_user)
      #     @mock_user.should_receive(:save).and_return(true)
      #     puts "---------- #{@mock_user.inspect}"
      do_post(params)

      #response.should be_success
      #    flash[:notice].should be_eql("Account registered!")
      response.should render_template(:new)
    end


    it "should create a new user and redirect to users list page" do
      @user = Factory.attributes_for(:user)
      #             @user = Factory.build(:valid_user)
      params={:user=>{:first_name=> "sasideep1235", :last_name=> "ram12",
          :phone_number=> "9999999990", :is_admin=> false, :role_id=> "2",
          :email=> "sasideep1232325@live.com",:password=>"test123",:password_confirmation=>"test123"}}
      User.stub!(:user_create).and_return(mock_user)
      @mock_user.stub!(:save).and_return(true)
      #     puts "---------- #{@mock_user.inspect}"
      #  puts " factory **** #{@current_user.inspect}"
      do_post(params)

      #    response.should be_success
      #    flash[:notice].should be_eql("Account registered!")
      response.should redirect_to(users_path)
    end
  end
  describe "show" do
   
    it "should render show page" do
      user = User.create
      get :show, {:id => user.to_param}
      assigns(:user).should eq(@mock_user)

    end
  end

  #  describe "edit" do
  #    @user = Factory.create(:user)
  #
  #    it "should go to Edit page when called with valid attributes" do
  #
  #    end
  #  end

  describe "update" do
    def do_put(params = {})
      put :update , params
    end

    it "should Update the User data and go to Show page" do

      #@user = Factory.create(:example_user)
      params={ :user=>{:id => "1","first_name" => "sasidsksseep1235", "last_name" => "ramg12",
          "phone_number" => "9999999990", "email" => "admin1ggqq233e@admin.com"}}
      User.should_receive(:find_by_id).with("1").and_return(@mock_user)

      @mock_user.should_receive(:update_attributes!).with(params[:user]).and_return(@mock_user)
      do_put(params)
      puts "In Spec Before Post $$$$$$$ #{@mock_user.first_name.inspect}"
      #      @mock_category.should_receive(:web_attribute).and_return(mock_web_attribute)

      #           @mock_user.reload
      puts " In Spec After post ^^^^^^ #{@mock_user.first_name.inspect} "
      #      @mock_user.first_name.should eq("sasideep1235")


      #      response.should  redirect_to(user_path(@mock_user.id))
      response.should  redirect_to(@mock_user)


      #      response.should redirect_to(:action => "show")
      #assigns[:form_action].should eql(:update)
      #      response.should render_template('admin/categories/edit')
    end
  end
end