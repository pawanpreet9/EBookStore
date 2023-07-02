class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_date
      t.string :isbn
      t.float :average_rating
      t.string :publisher
      t.string :pages
      t.string :language

      t.timestamps
    end
  end
end
