class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings, { id: false }  do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.float :value

      t.timestamps null: false
    end
    execute 'ALTER TABLE ratings ADD PRIMARY KEY(restaurant_id, user_id)'
  end
end
