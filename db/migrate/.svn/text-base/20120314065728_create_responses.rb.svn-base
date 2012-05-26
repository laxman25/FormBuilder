class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer  "test_id"

                                t.integer  :user_id

                                t.integer  :question_id

                               t.string   :selected_answer
                               
                               t.boolean   :is_correct                                

                                t.datetime "created_at",      :null => false

                                t.datetime "updated_at",      :null => false
                                t.integer :no_of_attempts 
                                



      t.timestamps
    end
  end
    
end
