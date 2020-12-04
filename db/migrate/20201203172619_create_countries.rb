class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    drop_table :countries
    create_table :countries do |t|
      t.string :country
      t.references :system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
