class CreateSysParams < ActiveRecord::Migration[5.0]
  def change
    create_table :sys_params do |t|
      t.string :name, comment: '名称'
      t.string :code
      t.string :val, comment: '值'
      t.string :desc, comment: '描述'

      t.timestamps
    end
  end
end
