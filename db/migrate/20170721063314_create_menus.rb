class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :desc
      t.string :source
      t.integer :parent_id

      t.timestamps
    end
  end
end
