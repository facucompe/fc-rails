class JobTable < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.json :response
      t.boolean :finished,           default: false
    end
  end
end
