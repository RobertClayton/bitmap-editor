# frozen_string_literal: true

module Bitmap
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
      when 'S'
        present
      end
    end

    def present
      bitmap_grid.grid.each do |line|
        puts line.join(' ')
      end
    end
  end
end
