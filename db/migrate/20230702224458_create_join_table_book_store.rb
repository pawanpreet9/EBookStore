class CreateJoinTableBookStore < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :stores do |t|
      t.index [:book_id, :store_id]
      t.index [:store_id, :book_id]
    end
  end
end
