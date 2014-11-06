class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user
      t.references :choice

      t.timestamps
    end
  end
end
