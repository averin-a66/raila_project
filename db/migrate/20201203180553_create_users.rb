class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :name
      t.string :surname
      t.numeric :role
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
