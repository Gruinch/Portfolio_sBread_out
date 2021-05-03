class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :img
      t.float :rate
      t.string :address
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
