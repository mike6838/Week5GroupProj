class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.string :choice_str1
      t.string :choice_str2
      t.string :choice_str3
      t.string :choice_str4
      t.string :choice_str5

      t.timestamps
    end
  end
end
