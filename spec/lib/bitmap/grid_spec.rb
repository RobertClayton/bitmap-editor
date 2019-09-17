# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bitmap::Grid do
  describe '#create' do
    it 'returns if an incorrect number of arguments are given' do
      warning_message = "Incorrect number of arguments for command: 'I'"
      expect { subject.create(%w[2 2 2]) }.to output(/.+#{warning_message}$/).to_stdout_from_any_process
    end

    it "creates a grid that only consists of 'O'" do
      subject.create(%w[4 4])
      expect(subject.grid.flatten.uniq).to eq ['O']
    end

    it 'creates a multi-dimensional array' do
      subject.create(%w[2 3])
      expect(subject.grid).to eq [%w[O O], %w[O O], %w[O O]]
    end
  end

  describe '#clear' do
    it 'returns if a grid has not been created yet' do
      warning_message = 'Grid can not be cleared before being created'
      expect { subject.clear }.to output(/.+#{warning_message}$/).to_stdout_from_any_process
    end

    it "sets each item in the grid to 'O'" do
      subject.create(%w[4 2])

      subject.single_cell(%w[2 1 X])
      expect(subject.grid).to eq [%w[O X O O], %w[O O O O]]

      subject.clear
      expect(subject.grid).to eq [%w[O O O O], %w[O O O O]]
    end
  end
end
