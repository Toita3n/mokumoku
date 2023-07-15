class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :following_id, null: false

      t.index [:follower_id, :following_id], unique: true

      t.timestamps
    end
  end
end
