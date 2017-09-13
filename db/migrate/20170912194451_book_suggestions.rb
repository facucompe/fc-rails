class BookSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :book_suggestions do |t|
      t.string :editorial,                        null: false, default: ""
      t.float :price,                             null: false, default: 0
      t.string :title                             null: false, default: ""
      t.string :author,                           null: false, default: ""
      t.string :link,                             null: false, default: ""
      t.string :publisher
      t.string :year
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end
