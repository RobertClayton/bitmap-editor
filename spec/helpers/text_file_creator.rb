# frozen_string_literal: true

require 'tempfile'

class TextFileCreator
  attr_reader :file_path

  def initialize
    @file_path = Tempfile.new('bitmap_test_file.txt', '/tmp').path
  end

  def add_command(command)
    File.open(file_path, 'a') do |file|
      file.puts(command.to_s)
    end
  end
end
