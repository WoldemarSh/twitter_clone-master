class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|

      t.references :follower_id
      t.references :followed_id

      t.timestamps
    end

    add_index :relationships, :follower
    add_index :relationships, :followed
    add_index :relationships, [:followed, :follower], unique: true

  end
end
