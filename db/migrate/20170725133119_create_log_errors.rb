class CreateLogErrors < ActiveRecord::Migration[5.0]
  def change
    create_table :log_errors do |t|
      t.string :name
      t.text :content
      t.integer :log_file_id
      t.string :error_date
      t.string :error_time

      t.timestamps
    end
  end
end
