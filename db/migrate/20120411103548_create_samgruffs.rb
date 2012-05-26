class CreateSamgruffs < ActiveRecord::Migration
  def change
    create_table :samgruffs do |t|

      t.timestamps
    end
  end
end
