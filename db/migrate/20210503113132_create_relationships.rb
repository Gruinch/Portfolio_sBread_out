class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :follower_id
    
    #↓同じユーザーをフォローしない設定#
      t.index [:user_id, :follower_id], unique: true
      
      t.timestamps
    end
  end
end
