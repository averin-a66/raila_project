class ChangeCountries < ActiveRecord::Migration[6.0]
  def change
    change_table :countries do |t|
      t.rename :country, :state
    end
  end
end
