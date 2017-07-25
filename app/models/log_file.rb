class LogFile < ApplicationRecord

  def file_name
    File.join(address, name)
  end
end
