# frozen_string_literal: true

require_relative 'bitmap/base'
require_relative 'bitmap/grid'
require_relative 'bitmap/presenter'
require 'logger'
require 'pry'

# This is the initial interface that the user interacts with
class BitmapEditor
  INVALID_FILE_ERROR = 'Please provide a correct file'
  VALID_COMMANDS = %w[I C L V H S].freeze

  attr_reader :logger, :presenter

  def initialize
    @logger = Logger.new(STDOUT)
    @presenter = Bitmap::Presenter.new
  end

  def run(file)
    logger.warn INVALID_FILE_ERROR and return unless valid_file(file)

    File.open(file).each do |line|
      line = line.chomp
      command = line.split

      if VALID_COMMANDS.include?(command.first)
        presenter.new_command(command)
      else
        logger.warn 'Command not recognised. This command line has been skipped.'
      end
    end
  end

  private

  def valid_file(file)
    file.nil? || !File.exist?(file) ? false : true
  end
end
