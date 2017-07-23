class AddColumToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :status, :integer, default: 1, comment: '枚举类型，状态'
    add_column :menus, :resource_type, :integer, default: 1

    add_column :roles, :status, :integer, default: 1
    add_column :users, :status, :integer, default: 1
  end
end
