class LogFile < ApplicationRecord
  has_many :log_errors

  def file_name
    File.join(address, name)
  end
end
