class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.string :name
      t.integer :user_id
      t.text :link
      t.string :lawyer

      t.timestamps

    end
  end
end
