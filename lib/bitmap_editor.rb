# frozen_string_literal: true

# This is the initial interface that the user interacts with
class BitmapEditor
  INVALID_FILE_ERROR = 'please provide correct file'

  def run(file)
    return INVALID_FILE_ERROR unless valid_file(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        puts 'There is no image'
      else
        puts 'unrecognised command :('
      end
    end
  end

  private

  def valid_file(file)
    return true unless file.nil? || !File.exist?(file)

    puts INVALID_FILE_ERROR
  end
end
