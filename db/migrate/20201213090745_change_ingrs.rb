class ChangeIngrs < ActiveRecord::Migration[6.0]
  def change
    drop_table :ingrs
    create_table :ingrs do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :name_in
      t.numeric :amount_in
      t.references :enum, null: false, foreign_key: true
      #t.references :user, null: false, foreign_key: true

      t.timestamps
  end
  end
  end
