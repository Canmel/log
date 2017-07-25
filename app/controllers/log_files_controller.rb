class LogFilesController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
    address = SysParam.find_by_code(:log_address).val
    projects = SysParam.find_by_code(:project).val.split(',')
    projects.each do |item|
      path = File.join(address, item)
      return redirect_to :log_files unless File::directory?(path)
      Dir.entries(path).each do|f|
        file_name = File.join(path, f)
        break if File::directory? file_name
        log_date = f.split('-')[1]
        LogFile.new({name: f, log_date: log_date, address: path}).save if LogFile.find_by_name(f).nil?
      end
    end


    @q = LogFile.ransack(params[:q])
    @log_files = @q.result
  end

  def new
    address = SysParam.find_by_code(:log_address).val
    projects = SysParam.find_by_code(:project).val.split(',')
    projects.each do |item|
      path = File.join(address, item)
      return redirect_to :log_files unless File::directory?(path)
      Dir.entries(path).each do|f|
        file_name = File.join(path, f)
        break if File::directory? file_name
        p read_file file_name if File.file? file_name

      end
    end
  end

  def edit
    @error_logs = read_file @log_file.file_name
  end


  private

  def read_file file_name
    @list = Redis::List.new('list_name', :maxlength => 25)
    error_lines = []
    error_line_num = 0
    File.open(file_name).each_line do |line|
      @list << line
      error_line_num = 15 if error_line? line
      if error_line_num.zero?
        temp_lines = ""
        @list.each do |el|
          temp_lines << el
        end
        error_lines << temp_lines
      end
      error_line_num -= 1 if error_line_num >= 0
    end
    error_lines
  end

  def read_files file_name
    error_lines = []
    error_line_num = 0
    @list = Redis::List.new('list_name', :maxlength => 25)
    File.open(file_name).each_line do |line|
      @list << line
      if error_line? line
        error_line_num = 15
      end
      if error_line_num.zero?
        @list.each do |el|
          error_lines << el
        end
      end
      error_line_num -= 1 if error_line_num >= 0
    end
    error_lines
  end

  def error_line?(line)
    (line =~ / Server Error/).present? || (line =~ / Server Error/).present?
  end
end
