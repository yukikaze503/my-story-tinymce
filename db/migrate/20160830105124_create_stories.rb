class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :avatar
      t.timestamps null: false
    end
  end
end
