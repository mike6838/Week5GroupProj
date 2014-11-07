class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user
      t.references :question
      t.integer :number

      t.timestamps
    end
  end
end
