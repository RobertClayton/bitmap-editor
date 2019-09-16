# frozen_string_literal: true

class TextFileCreator
  attr_reader :file_path

  def initialize
    @file_path = File.join(Dir.tmpdir, 'bitmap_test_file.txt')
  end

  def add_command(command)
    File.open(file_path, 'a') do |file|
      file.puts(command.to_s)
    end
  end
end
