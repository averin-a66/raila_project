class ChangeRecipe < ActiveRecord::Migration[6.0]
  def change
    #drop_table  :recipes
    #create_table :recipes do |t|
    # t.string :name
    # t.text :body
    # t.references :user, null: false, foreign_key: true
    # t.timestamps
    #end
    add_reference :recipes, :user,  index:true
    add_foreign_key :recipes, :users
    end
end
