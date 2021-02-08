class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.text :content
      t.string :title
      t.timestamps
    end
  end
end
