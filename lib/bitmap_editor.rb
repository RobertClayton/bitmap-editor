# frozen_string_literal: true

# This is the initial interface that the user interacts with
class BitmapEditor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

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
end
