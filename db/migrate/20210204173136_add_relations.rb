class AddRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :city, foreign_key: true
    add_reference :gossips, :user, foreign_key: true
  end
end
