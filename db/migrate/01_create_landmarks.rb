class CreateLandmarks < ActiveRecord::Migration
  create_table :landmarks do |t|
    t.string :name
    t.references :figure
    t.integer :year_completed
    t.timestamps
  end
end
