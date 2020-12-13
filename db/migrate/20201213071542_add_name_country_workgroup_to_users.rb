class AddNameCountryWorkgroupToUsers < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :name, :string, null:false, default: ""
    add_reference :users, :country,  index:true
    add_foreign_key :users, :countries
    add_column :users, :workgroup, :string
    add_index :users, :name, unique: true
  end
end
