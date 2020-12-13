class ChangeEnums < ActiveRecord::Migration[6.0]
  def change
    drop_table  :enums
    create_table :enums do |t|
      t.string :name
      t.string :short
      t.string :kind
      t.references :system, null: false, foreign_key: true

      t.timestamps
    end
    drop_table :enum_converts
    create_table :enum_converts do |t|
      t.references :enum_from, null: false, foreign_key: {to_table: :enums}
      t.references :enum_to, null: false, foreign_key: {to_table: :enums}
      t.numeric :ratio

      t.timestamps
      end
  end
end
