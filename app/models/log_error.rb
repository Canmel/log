class LogError < ApplicationRecord
  belongs_to :log_file

  class << self
    def build_from_error error_content, file_id
      error_d = 	/\[(.{10})T/.match error_content
      error_date =  error_d.nil? ? "" : error_d[1]
      error_t =  /T(.{16})#/.match(error_content)
      error_time = error_t.nil? ? "" : error_t[1]
      LogError.new(name: "Error", content: error_content, error_date: error_date, error_time: error_time, log_file_id: file_id).save
    end
  end
end
