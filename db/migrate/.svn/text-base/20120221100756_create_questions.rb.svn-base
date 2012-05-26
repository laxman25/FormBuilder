class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.integer :user_id
      t.string  :question
      t.string  :type_of_question
      t.string  :correct_answer       
      t.string :help_text
      t.integer :num_of_answers   
      t.integer :sort_order
      t.text :validation
      t.integer :size
      t.string :tags
      t.string :difficulty_level
      t.timestamps
    end
  end
end