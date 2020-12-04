class CreateIngrs < ActiveRecord::Migration[6.0]
  def change
    create_table :ingrs do |t|
      t.references :recipe_id
      t.string :name_in
      t.numeric :amount_in
      t.string :system_in

      t.timestamps
    end
  end
end
