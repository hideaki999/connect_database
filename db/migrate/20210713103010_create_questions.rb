class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question, :null => false
      t.timestamps
    end
  end
end
