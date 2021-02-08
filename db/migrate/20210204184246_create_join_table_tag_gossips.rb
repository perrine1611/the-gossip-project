class CreateJoinTableTagGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_tag_gossips do |t|
      t.references :gossip, index: true
      t.references :tag, index: true
      t.timestamps
    end
  end
end
