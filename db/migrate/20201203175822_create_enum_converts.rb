class CreateEnumConverts < ActiveRecord::Migration[6.0]
  def change
    create_table :enum_converts do |t|
      t.references :enum_from, null: false, foreign_key: true
      t.references :enum_to, null: false, foreign_key: true
      t.numeric :ratio

      t.timestamps
    end
  end
end
