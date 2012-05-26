class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.string :code
      t.string :name
      t.integer :category_id
      t.string :help_text
      t.integer :no_of_questions
      t.string :state,:default => "inactive"
      t.timestamps
    end
  end  
end