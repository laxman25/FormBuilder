class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @initial_question_number  = 0
    @test = Test.find_by_id(params[:test_id])
    @question = @test.questions.build
  end

  def create
    correct_answer = params[:correct_answer][:string]
    @initial_question_number  = params[:next][:number].to_i
    @test = Test.find_by_id(params[:test_id])
    if@initial_question_number <= @test.no_of_questions
      @initial_question_number +=1
      @question = @test.questions.build(params[:question])      
      Question.transaction do
        @question.user_id=current_user.id
        @question.correct_answer = correct_answer        
        @question.save
        if @initial_question_number-1 == @test.no_of_questions
          @test.state="active"
        @test.save
        end
        if @question.type_of_question =="text"          
            @question.correct_answer=params[:corrct_text_answer];          
          @question.answers.create(:answer=>" ")
        else
          params[:answers].reject(&:blank?).each do |a|
            @question.answers.create(:answer=>a)
          end
        end
      end
      @question.user_id=current_user.id
    @question.save
    else
      redirect_to questions_path
    end
  end

  def edit
    @initial_question_number  = 0
    @test = Test.find_by_id(params[:id])
    @question = @test.questions.first
  end

  def update
    @initial_question_number  = params[:next][:number].to_i

    @test = Test.find_by_id(params[:test_id])
    @question = @test.questions.find(params[:id])
    @question.update_attributes(params[:question])

    # @question1=Question.find_by_id(params[:question_id])
    # @answer=@question1.answers.find(params[:id])
    # @answer.update_attributes(params[:answer])

    @initial_question_number +=1
  # if @initial_question_number-1 == @test.no_of_questions
  # @test.state="active"
  # @test.update_attribute(:state)
  # end

  #   redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url
  end
end