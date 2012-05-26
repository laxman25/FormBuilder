module ResponsesHelper

    def display_answer(question) 
    if @response_count.nil? 
      local_count = 1 
    else 
     local_count=@response_count.no_of_attempts

    end

   response = Response.where("test_id=? and question_id =? and no_of_attempts = ? ",@test.id ,question.id,local_count).first

   if response.nil?

     image_tag("/images/wrong.png")

    else 
     
      response.is_correct? ?image_tag("/images/tick.png") : image_tag("/images/wrong.png")

   end 
  end 
end