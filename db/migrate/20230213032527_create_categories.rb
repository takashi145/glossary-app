class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :user, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
