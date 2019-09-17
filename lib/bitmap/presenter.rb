# frozen_string_literal: true

module Bitmap
  class Presenter
    attr_reader :grid

    def initialize
      @grid = Grid.new
    end

    def new_command(line)
      operation = line.first
      parameters = line[1..-1]

      case operation
      when 'I'
        grid.create(parameters)
      end
    end
  end
end
