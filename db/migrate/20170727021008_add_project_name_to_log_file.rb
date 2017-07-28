class AddProjectNameToLogFile < ActiveRecord::Migration[5.0]
  def change
    add_column :log_files, :project_name, :string, comment: '文件的项目名称'
  end
end
