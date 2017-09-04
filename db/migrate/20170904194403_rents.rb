class Rents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|      
      t.date :from,                                 null: false, default: ""
      t.date :to,                                   null: false, default: ""
      t.references :user, foreign_key: true,        null: false, default: ""
      t.references :book, foreign_key: true,        null: false, default: ""
    end
  end
end
