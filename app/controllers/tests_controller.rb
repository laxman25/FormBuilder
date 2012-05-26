class TestsController < ApplicationController
  def index
    @tests = Test.order("id").page(params[:page]).per(10)
    @categories =Category.all
    
  end
  
  def new
    @test=Test.new
  end

  def create
    @test = Test.new(params[:test])    
    if @test.save
     flash[:notice] = "test Created"
      redirect_to new_test_question_path(@test)
    else
      render  "new"
    end
  end

  def show
     @test= Test.find(params[:id])
     # .order("id").page(params[:page]).per(10)
  end


  def edit
    @test= Test.find(params[:id])
  end

  def update    
    @test = Test.find(params[:id])
    if @test.update_attributes(params[:test])
      redirect_to edit_test_question_path(@test)
    else
      render :action=> "edit"
    end
  end

  def destroy
    @test= Test.find(params[:id])
    @test.destroy
    redirect_to tests_path 
  end

  def show
    @test = Test.find(params[:id])
  end
  def tests_normal_show

# raise params.inspect 
selected_cat_id =params[:id] 
 @tests= Test.where("category_id=?", selected_cat_id) 
#    raise  @category.id.inspect 
end
  # def report
#     
    # for questions in @test.questions
# 
      # if questions.type_of_question =="radio"
      # eval =Evaluate.new(:selected_answer => :answer.selctedvalue) 
     # end
#      
   # end
    #@test=Test.all
    #raise @test.inspect
    
  #  @evaluate = Evaluate.new(params[:id])
   # raise @evaluate.inspect
    
   # if @evaluate.save
      
    #end
    
    # raise params.inspect;
  # end
  
end
