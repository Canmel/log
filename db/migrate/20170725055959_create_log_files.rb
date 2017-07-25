class CreateLogFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :log_files do |t|
      t.string :name
      t.string :log_date
      t.string :address

      t.timestamps
    end
  end
end
