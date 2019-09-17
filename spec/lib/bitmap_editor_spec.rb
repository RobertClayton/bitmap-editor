# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor do
  describe '#run' do
    let(:text_file) { TextFileCreator.new }
    let(:incorrect_file) { 'Please provide a correct file' }
    let(:not_recognised) { 'Command not recognised. This command line has been skipped.' }

    it 'returns when provided a file that does not exist' do
      expect { subject.run('fake.txt') }.to output(/.+#{incorrect_file}$/).to_stdout_from_any_process
    end

    it 'returns a warning when a command is not recognised' do
      text_file.add_command('Q')
      expect { subject.run(text_file.file_path) }.to output(/.+#{not_recognised}$/).to_stdout_from_any_process
    end

    it 'returns a warning when a command is more than one character' do
      text_file.add_command('VV')
      expect { subject.run(text_file.file_path) }.to output(/.+#{not_recognised}$/).to_stdout_from_any_process
    end

    it 'returns a warning when a command is not a capital letter' do
      text_file.add_command('x')
      expect { subject.run(text_file.file_path) }.to output(/.+#{not_recognised}$/).to_stdout_from_any_process
    end
  end
end
