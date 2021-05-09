class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :post_img_id
      t.float :rate
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
