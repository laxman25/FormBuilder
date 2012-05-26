class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string  :name
      t.timestamps
    end
  Choice.reset_column_information
  Choice.create(:name=>"text")
  Choice.create(:name=>"checkbox")
  Choice.create(:name=>"radio")  
  end
end
