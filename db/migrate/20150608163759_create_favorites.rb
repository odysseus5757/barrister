class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :brief_id
      t.text :comment

      t.timestamps

    end
  end
end
