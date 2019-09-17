# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor do
  describe '#run' do
    it 'returns when provided a file that does not exist' do
      expected_warning = 'Please provide a correct file'

      expect { subject.run('fake.txt') }.to output(/.+#{expected_warning}$/).to_stdout_from_any_process
    end

    it 'returns a warning when a command is not recognised' do
      text_file = TextFileCreator.new
      text_file.add_command('x')
      expected_warning = 'Command: x is not recognised. This command line has been skipped.'

      expect { subject.run(text_file.file_path) }.to output(/.+#{expected_warning}$/).to_stdout_from_any_process
    end
  end
end
