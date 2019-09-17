# frozen_string_literal: true

module Bitmap
  class Grid < Base
    attr_reader :grid, :m, :n

    def create(*args)
      return if valid_params(2, 'I', args)

      @m = args.flatten[0].to_i
      @n = args.flatten[1].to_i
      reset_grid
    end

    def clear
      logger.warn "Grid can not be cleared before being created" and return false if n.nil? || m.nil?

      reset_grid
    end

    private

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
    end
  end
end
