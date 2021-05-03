class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
