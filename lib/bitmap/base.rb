# frozen_string_literal: true

require 'logger'

module Bitmap
  class Base
    attr_reader :logger

    def initialize
      @logger = Logger.new(STDOUT)
    end
  end
end
