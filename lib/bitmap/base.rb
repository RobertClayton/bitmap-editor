# frozen_string_literal: true

require 'logger'

module Bitmap
  # Initializes logger
  class Base
    attr_reader :logger

    def initialize
      @logger = Logger.new(STDOUT)
    end
  end
end
