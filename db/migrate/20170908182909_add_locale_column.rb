class AddLocaleColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :string, null: false
  end
end
