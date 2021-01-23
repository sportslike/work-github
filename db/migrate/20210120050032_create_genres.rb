class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :is_delete, null: false, default: false
      
    end
  end
end
