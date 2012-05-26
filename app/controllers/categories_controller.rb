class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
     @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    @category.save
  end

  def show
    @category = @current_test
  end

  def edit
    @category = @current_test
  end
  def addnew
    @category = Category.new(params[:category])
    @category.save
    render :update do |page|
     page.replace_html 'update_div', :partial =>'tests/dropdown'
   end

  end
end




