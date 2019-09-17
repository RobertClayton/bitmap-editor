# frozen_string_literal: true

module Bitmap
  # Presents the bitmap
  class Presenter
    attr_reader :bitmap_grid

    def initialize
      @bitmap_grid = Grid.new
    end

    def new_command(line)
      operation = line.first
      parameters = line[1..-1]

      case operation
      when 'I'
        bitmap_grid.create(parameters)
      when 'C'
        bitmap_grid.clear
      when 'L'
        bitmap_grid.single_cell(parameters)
      when 'V'
        bitmap_grid.vertical(parameters)
      when 'H'
        bitmap_grid.horizontal(parameters)
      when 'S'
        present
      end
    end

    private

    def present
      bitmap_grid.grid.each do |line|
        puts line.join(' ')
      end
    end
  end
end
