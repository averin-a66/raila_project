class CreateEnums < ActiveRecord::Migration[6.0]
  def change
    create_table :enums do |t|
      t.string :name
      t.string :short
      t.string :class
      t.references :system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
