class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user
      t.references :question
      t.integer :answer_number

      t.timestamps
    end
  end
end
accumulative = []

Pick.where(question_id: 1, answer_number: 1 )