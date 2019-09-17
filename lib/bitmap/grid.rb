# frozen_string_literal: true

module Bitmap
  # Encapsulates the logic surrounding editing the grid
  class Grid < Base
    attr_reader :grid, :m, :n

    def create(*args)
      return unless valid_params(2, 'I', args)

      m, n = args.flatten
      @m = m.to_i
      @n = n.to_i
      reset_grid
    end

    def clear
      logger.warn 'Grid can not be cleared before being created' and return false if n.nil? || m.nil?

      reset_grid
    end

    def single_cell(*args)
      return unless valid_params(3, 'L', args)

      x, y, c = args.flatten
      grid[format_num(y)][format_num(x)] = c
    end

    def vertical(*args)
      x, y1, y2, c = args.flatten

      coordinates = Array(y1.to_i..y2.to_i).each_with_object([]) do |y, arr|
        arr << [x.to_i, y]
      end

      coordinates.each do |coordinate|
        single_cell(coordinate << c)
      end
    end

    def horizontal(*args)
      x1, x2, y, c = args.flatten

      coordinates = Array(x1.to_i..x2.to_i).each_with_object([]) do |x, arr|
        arr << [x, y.to_i]
      end

      coordinates.each do |coordinate|
        single_cell(coordinate << c)
      end
    end

    private

    def format_num(number)
      number.to_i - 1
    end

    def reset_grid
      @grid = Array.new(n) { Array.new(m, 'O') }
    end

    def valid_params(num_of_args_required, command, *args)
      # TODO: whitespace errors
      # TODO: integers only for integer arguments
      # TODO: maximum grid size of 250 x 250
      # TODO: colours to only be a letter
      # TODO: colours to only be uppercase

      logger.warn "Incorrect number of arguments for command: '#{command}'" and return false if num_of_args_required != args.flatten.count
      true
    end
  end
end
