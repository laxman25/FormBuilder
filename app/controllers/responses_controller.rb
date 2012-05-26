class ResponsesController < ApplicationController 
  def new 
  end

  def report

    @test =  Test.find_by_id(params[:test_id][:number].to_i) 
    @questions  = @test.questions 
    @response_count=Response.where("test_id= ? and user_id =?",@test.id,current_user.id).last 
    # raise response_count.inspect 
    if @response_count.nil? 
    local_no_of_attempts = 1 
    else 
    local_no_of_attempts = @response_count.no_of_attempts + 1 
    # local_no_of_attempts=1 
    # else 
    # # raise response_count.no_of_attempts.inspect 
    # local_no_of_attempts = response_count.no_of_attempts + 1 
    end 
     if  params[:q[0]].blank? 
     else 
    
    params[:q[0]].each do |qid| 
      qid.each do |k, v| 
#        raise v.inspect

        question = Question.where("id = ?  and test_id = ? ",k.to_i,@test.id).first 
        @response_count=Response.where("test_id= ? and user_id =?",@test.id,current_user.id).last

       
          if question.type_of_question == "checkbox" 
            correct_answer = question.correct_answer 
            arr=question.correct_answer.split(",");            
            answer = v.to_a 
            c=0; 
            if answer.size==arr.size 
            answer.each do |i|             
              if correct_answer.include?(i) 
                  c+=1; 
              end             
            end            
            if c== arr.size 
            is_correct_flag= true 
            else 
               is_correct_flag= false 
            end 
            else 
              is_correct_flag= false 
            end 
         else 
           v.each do |answer|
             answer.gsub!(/^\s* /,'')
#             raise answer.inspect
             is_correct_flag = question.correct_answer == answer ? true : false 
           end          
          end

          # local_no_of_attempts = response_count.no_of_attempts + 1 
          Response.create(:test_id=>@test.id ,:user_id=>current_user.id ,:no_of_attempts => local_no_of_attempts,:question_id => k.to_i,:selected_answer=> answer,:is_correct=> is_correct_flag)

        end 
      end 
   

    
#       redirect_to  test_path(@test) 
#      end 
  end 
  @responses  = Response.where("test_id = ? and user_id =? and no_of_attempts =?",@test.id,current_user.id,local_no_of_attempts).collect{ |c|  c  if c.is_correct == true   }.compact

 end 
end

