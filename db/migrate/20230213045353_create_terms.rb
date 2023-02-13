class CreateTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :terms do |t|
      t.string :name, null: false
      t.text   :description, null: false
      t.references :category, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
